// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'
Shader "Custom/Easy2" {
    Properties {
        _LColor ("Light Color", Color) = (1,1,1,1)
        _Dir ("Light Dir", Vector) = (0,0,1,0)
        _Intensity("Intensity", float) = 1.0
    }

    SubShader{
        Tags {"RenderType" = "Opaque"}
        LOD 100
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct v2f{
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            fixed4 _LColor;
            fixed4 _Dir;
            fixed _Intensity;

            v2f vert(appdata_base v){
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
				// o.vertex = UnityObjectToClipPos(v.vertex);
                o.normal = v.normal;
                return o;
            }

            fixed frag(v2f i): Color{
				// light dir
                fixed3 dir = fixed3(-_Dir.x,-_Dir.y,-_Dir.z);
				// fixed3 dir = fixed3(_Dir.x,_Dir.y,_Dir.z);
                dir = normalize(dir);
                fixed3 nrm = normalize(i.normal);
                float bis = dot(dir,nrm);
                if(bis <= 0){
                    bis = 0;
                }
                fixed3 col = _LColor * bis * _Intensity;
                //fixed3 col = _LColor;
                return col;
            }
            ENDCG
        }
    }

}
