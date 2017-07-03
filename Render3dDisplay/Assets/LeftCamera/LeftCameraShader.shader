
Shader "Hidden/NewImageEffectShader"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};
		
			int mod(float a, float b)
			{
				return a - floor(a / b) * b;
			}

			sampler2D _MainTex;

			v2f vert(appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}

			fixed4 frag(v2f i) : SV_Target
			{
				const int kDisplayWidth = 1024;
				fixed4 col = tex2D(_MainTex, i.uv);
				if (mod(i.uv.x * kDisplayWidth, 2) == 1 )
					return fixed4(col.r, 0.0f, col.b, 1.0f);
				else
					return fixed4(0.0f, col.g, 0.0f, 1.0f);
			}
			ENDCG
		}
	}
}
