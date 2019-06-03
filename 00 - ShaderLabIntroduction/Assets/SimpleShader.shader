Shader "My shaders/SimpleShader"
{
    Properties
    {
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert   // vertex shader function definition
            #pragma fragment frag // pixel shader function definition

            #include "UnityCG.cginc" // predefined unity function include file

			// input data for the vertex shader
            struct appdata
            {
				// every vertex containe 
                float4 vertex : POSITION; // a position vector
                float4 color : COLOR;     // and a color value
            };

			// data passed to the pixel shader from the vertex shdaer after the rasterization stage
            struct v2f
            {
				// Semantics with the SV prefix are "system value" semantics, this means that they have a specific meaning to the rendering pipeline. 
				// if it's attached to a vertex shader output SV_POSITION means that the output will contain the final transformed vertex position used for rasterization
                float4 vertex : SV_POSITION;
				float4 color : COLOR;
            };

			// vertex shader function
            v2f vert (appdata v)
            {
                v2f o;
				// Transforms a point from object space to the camera’s clip space in homogeneous coordinates. 
				// This is the equivalent of mul(UNITY_MATRIX_MVP, float4(pos, 1.0)), and should be used in its place.
                o.vertex = UnityObjectToClipPos(v.vertex);
				o.color = v.color;
				return o;
            }

			// pixel shader function
            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = i.color;
                return col;
            }
            ENDCG
        }
    }
}
