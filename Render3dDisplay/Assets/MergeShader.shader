Shader "Unlit/MergeShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_LeftTex ("LeftTexture", 2D) = "white" {}
		_RightTex ("RightTexture", 2D) = "white" {}
	}
	SubShader
	{
		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			// make fog work
			#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			sampler2D _LeftTex;
			sampler2D _RightTex;
			float4 _MainTex_ST;
			

			int mod(float a, float b)
			{
				return a - floor(a / b) * b;
			}

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				const int kDisplayWidth = 1024;
				fixed4 leftCamera = tex2D(_LeftTex, i.uv);
				fixed4 rightCamera = tex2D(_RightTex, i.uv);
				if (mod(i.uv.x * kDisplayWidth, 2) == 1)
					return fixed4(leftCamera.r, rightCamera.g, leftCamera.b, 1.0f);
				else
					return fixed4(rightCamera.r, leftCamera.g, rightCamera.b, 1.0f);
				
				return rightCamera;
			}
			ENDCG
		}
	}
}
