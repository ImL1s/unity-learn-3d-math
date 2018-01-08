Shader "Custom/05_InOutVertFrag" {
        Properties {
        _LColor ("Light Color", Color) = (1,1,1,1)
        _Dir ("Light Dir", Vector) = (0,0,1,0)
        _Intensity("Intensity", float) = 1.0
        }
        SubShader{
        pass {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
         //vertex input: position, color
         //頂點輸入訊息:當前頂點位置(物體座標系)和顏色
        struct appdata {
                float2 vertex : POSITION;
                fixed4 color : COLOR;
                };
        // 象素著色器使用的結構體
        struct v2f {
                float4 pos : SV_POSITION;
                fixed4 color : COLOR;
                };
        v2f vert(appdata v) {
            v2f o;
            v.color = float4(v.vertex, 0, 1);
            o.pos = float4(v.vertex, 0, 1);
            //o.color = float4(v.vertex, 0, 1);
            o.color = v.color;
            return o;
            }

        fixed4 frag(v2f i) : SV_Target
        { 
            return i.color; 
        }
        ENDCG
        }
        }
}
 
