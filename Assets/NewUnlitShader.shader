Shader "Unlit/NewUnlitShader"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _MainTex("Albedo", 2D) = "white" {}

        _Cutoff("Alpha Cutoff", Range(0.0, 1.0)) = 0.5

        _Glossiness("Smoothness", Range(0.0, 1.0)) = 0.75
        _GlossMapScale("Smoothness Scale", Range(0.0, 1.0)) = 1.0
        [Enum(Metallic Alpha,0,Albedo Alpha,1)] _SmoothnessTextureChannel ("Smoothness texture channel", Float) = 0

        _Metallic("Metallic", Range(0.0, 1.0)) = 0.75
        _MetallicGlossMap("Metallic", 2D) = "white" {}

        [ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0

        [ToggleOff] _GlossyReflections("Glossy Reflections", Float) = 1.0

        _BumpScale("Scale", Float) = 1.0
        [Normal] _BumpMap("Normal Map", 2D) = "bump" {}

        _Parallax ("Height Scale", Range (0.005, 0.08)) = 0.02
        _ParallaxMap ("Height Map", 2D) = "black" {}

        _OcclusionStrength("Strength", Range(0.0, 1.0)) = 1.0
        _OcclusionMap("Occlusion", 2D) = "white" {}

        _EmissionColor("Color", Color) = (0,0,0)
        _EmissionMap("Emission", 2D) = "white" {}

        _DetailMask("Detail Mask", 2D) = "white" {}

        _DetailAlbedoMap("Detail Albedo x2", 2D) = "grey" {}
        _DetailNormalMapScale("Scale", Float) = 1.0
        [Normal] _DetailNormalMap("Normal Map", 2D) = "bump" {}

        [Enum(UV0,0,UV1,1)] _UVSec ("UV Set for secondary textures", Float) = 0


        // Blending state
        [HideInInspector] _Mode ("__mode", Float) = 0.0
        [HideInInspector] _SrcBlend ("__src", Float) = 1.0
        [HideInInspector] _DstBlend ("__dst", Float) = 0.0
        [HideInInspector] _ZWrite ("__zw", Float) = 1.0
    }

    CGINCLUDE
        #define UNITY_SETUP_BRDF_INPUT MetallicSetup
    ENDCG

    SubShader
    {
        Tags { "RenderType" = "Opaque" "PerformanceChecks" = "False" }

        Pass
        {
            Name "FORWARD"
            Tags { "LightMode" = "ForwardBase" }

            Blend[_SrcBlend][_DstBlend]
            ZWrite[_ZWrite]

            CGPROGRAM

            #pragma target 3.0

            #pragma shader_feature_local _NORMALMAP
            #pragma shader_feature_local _ _ALPHATEST_ON _ALPHABLEND_ON _ALPHAPREMULTIPLY_ON
            #pragma shader_feature_fragment _EMISSION
            #pragma shader_feature_local _METALLICGLOSSMAP
            #pragma shader_feature_local_fragment _DETAIL_MULX2
            #pragma shader_feature_local_fragment _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
            #pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
            #pragma shader_feature_local_fragment _GLOSSYREFLECTIONS_OFF
            #pragma shader_feature_local _PARALLAXMAP

            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma multi_compile_instancing

            #pragma multi_compile CHANNEL_R_OUTPUT_0_0 CHANNEL_R_OUTPUT_0_1 CHANNEL_R_OUTPUT_0_2 CHANNEL_R_OUTPUT_0_3 CHANNEL_R_OUTPUT_0_4 CHANNEL_R_OUTPUT_0_5 CHANNEL_R_OUTPUT_0_6 CHANNEL_R_OUTPUT_0_7 CHANNEL_R_OUTPUT_0_8 CHANNEL_R_OUTPUT_0_9 CHANNEL_R_OUTPUT_1_0
            #pragma multi_compile CHANNEL_G_OUTPUT_0_0 CHANNEL_G_OUTPUT_0_1 CHANNEL_G_OUTPUT_0_2 CHANNEL_G_OUTPUT_0_3 CHANNEL_G_OUTPUT_0_4 CHANNEL_G_OUTPUT_0_5 CHANNEL_G_OUTPUT_0_6 CHANNEL_G_OUTPUT_0_7 CHANNEL_G_OUTPUT_0_8 CHANNEL_G_OUTPUT_0_9 CHANNEL_G_OUTPUT_1_0
            #pragma multi_compile CHANNEL_B_OUTPUT_0_0 CHANNEL_B_OUTPUT_0_1 CHANNEL_B_OUTPUT_0_2 CHANNEL_B_OUTPUT_0_3 CHANNEL_B_OUTPUT_0_4 CHANNEL_B_OUTPUT_0_5 CHANNEL_B_OUTPUT_0_6 CHANNEL_B_OUTPUT_0_7 CHANNEL_B_OUTPUT_0_8 CHANNEL_B_OUTPUT_0_9 CHANNEL_B_OUTPUT_1_0

            #pragma vertex vertBase
            #pragma fragment frag

            #include "UnityStandardCoreForward.cginc"

            half4 frag(VertexOutputForwardBase i) : SV_Target
            {
                half4 unityStandardColor = fragForwardBaseInternal(i);

                float rChannelOutput;
                #if CHANNEL_R_OUTPUT_0_0
                    rChannelOutput = 0.0;
                #endif
                #if CHANNEL_R_OUTPUT_0_1
                    rChannelOutput = 0.1;
                #endif
                #if CHANNEL_R_OUTPUT_0_2
                    rChannelOutput = 0.2;
                #endif
                #if CHANNEL_R_OUTPUT_0_3
                    rChannelOutput = 0.3;
                #endif
                #if CHANNEL_R_OUTPUT_0_4
                    rChannelOutput = 0.4;
                #endif
                #if CHANNEL_R_OUTPUT_0_5
                    rChannelOutput = 0.5;
                #endif
                #if CHANNEL_R_OUTPUT_0_6
                    rChannelOutput = 0.6;
                #endif
                #if CHANNEL_R_OUTPUT_0_7
                    rChannelOutput = 0.7;
                #endif
                #if CHANNEL_R_OUTPUT_0_8
                    rChannelOutput = 0.8;
                #endif
                #if CHANNEL_R_OUTPUT_0_9
                    rChannelOutput = 0.9;
                #endif
                #if CHANNEL_R_OUTPUT_1_0
                    rChannelOutput = 1.0;
                #endif

                float gChannelOutput;
                #if CHANNEL_G_OUTPUT_0_0
                    gChannelOutput = 0.0;
                #endif
                #if CHANNEL_G_OUTPUT_0_1
                    gChannelOutput = 0.1;
                #endif
                #if CHANNEL_G_OUTPUT_0_2
                    gChannelOutput = 0.2;
                #endif
                #if CHANNEL_G_OUTPUT_0_3
                    gChannelOutput = 0.3;
                #endif
                #if CHANNEL_G_OUTPUT_0_4
                    gChannelOutput = 0.4;
                #endif
                #if CHANNEL_G_OUTPUT_0_5
                    gChannelOutput = 0.5;
                #endif
                #if CHANNEL_G_OUTPUT_0_6
                    gChannelOutput = 0.6;
                #endif
                #if CHANNEL_G_OUTPUT_0_7
                    gChannelOutput = 0.7;
                #endif
                #if CHANNEL_G_OUTPUT_0_8
                    gChannelOutput = 0.8;
                #endif
                #if CHANNEL_G_OUTPUT_0_9
                    gChannelOutput = 0.9;
                #endif
                #if CHANNEL_G_OUTPUT_1_0
                    gChannelOutput = 1.0;
                #endif

                float bChannelOutput;
                #if CHANNEL_B_OUTPUT_0_0
                    bChannelOutput = 0.0;
                #endif
                #if CHANNEL_B_OUTPUT_0_1
                    bChannelOutput = 0.1;
                #endif
                #if CHANNEL_B_OUTPUT_0_2
                    bChannelOutput = 0.2;
                #endif
                #if CHANNEL_B_OUTPUT_0_3
                    bChannelOutput = 0.3;
                #endif
                #if CHANNEL_B_OUTPUT_0_4
                    bChannelOutput = 0.4;
                #endif
                #if CHANNEL_B_OUTPUT_0_5
                    bChannelOutput = 0.5;
                #endif
                #if CHANNEL_B_OUTPUT_0_6
                    bChannelOutput = 0.6;
                #endif
                #if CHANNEL_B_OUTPUT_0_7
                    bChannelOutput = 0.7;
                #endif
                #if CHANNEL_B_OUTPUT_0_8
                    bChannelOutput = 0.8;
                #endif
                #if CHANNEL_B_OUTPUT_0_9
                    bChannelOutput = 0.9;
                #endif
                #if CHANNEL_B_OUTPUT_1_0
                    bChannelOutput = 1.0;
                #endif

                float4 myChannels = float4(rChannelOutput, gChannelOutput, bChannelOutput, 1);
                float myRatio = 0.6;
                return myRatio * myChannels + (1- myRatio) * unityStandardColor;
            }
            ENDCG
        }
    }
}
