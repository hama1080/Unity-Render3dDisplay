Shader "myShader" {
	Properties{
		_MainTex("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
    Pass {
	  GLSLPROGRAM

uniform sampler2D _MainTex;

#ifdef VERTEX
	  void main()
  {
	  gl_TexCoord[0] = gl_MultiTexCoord0;
	  gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
  }
#endif

#ifdef FRAGMENT
  void main()
  {
	  gl_FragColor = vec4(0.0, 0.0, gl_FragCoord.y / 512.0, 1.0);
	 
	  /*vec4 texture_color = texture2D(_MainTex, vec2(gl_TexCoord[0]));
	  gl_FragColor = vec4(texture_color.r, 0, 0, 1);

	  if (gl_FragCoord.x > 500) {
		 // gl_FragColor = texture2D(_MainTex, vec2(gl_TexCoord[0]));
		 gl_FragColor = vec4(0.0, 0.0, gl_FragCoord.y / 512.0, 1.0);
	  }
	  */
  }
#endif


	  ENDGLSL
    }
  }
}



