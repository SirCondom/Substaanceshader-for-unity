// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "SirHoly/Builtin/Armor shader"
{
	Properties
	{
		_Base("Base", 2D) = "white" {}
		_Emission("Emission", 2D) = "white" {}
		_Mat("Mat", 2D) = "white" {}
		[Normal]_Normalmap("Normalmap", 2D) = "bump" {}
		_Roughness("Roughness", 2D) = "white" {}
		_AO("AO", 2D) = "white" {}
		_Smooth("Smooth", Float) = 0.1
		_Rough("Rough", Float) = 0.79
		_Color0("Color 0", Color) = (1,1,1,0)
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#pragma target 5.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Normalmap;
		uniform float4 _Normalmap_ST;
		uniform sampler2D _Base;
		uniform float4 _Base_ST;
		uniform float4 _Color0;
		uniform sampler2D _Emission;
		uniform float4 _Emission_ST;
		uniform float _Smooth;
		uniform sampler2D _Mat;
		uniform float4 _Mat_ST;
		uniform sampler2D _Roughness;
		uniform float4 _Roughness_ST;
		uniform float _Rough;
		uniform sampler2D _AO;
		uniform float4 _AO_ST;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Normalmap = i.uv_texcoord * _Normalmap_ST.xy + _Normalmap_ST.zw;
			o.Normal = UnpackNormal( tex2D( _Normalmap, uv_Normalmap ) );
			float2 uv_Base = i.uv_texcoord * _Base_ST.xy + _Base_ST.zw;
			o.Albedo = ( tex2D( _Base, uv_Base ) * _Color0 ).rgb;
			float2 uv_Emission = i.uv_texcoord * _Emission_ST.xy + _Emission_ST.zw;
			o.Emission = tex2D( _Emission, uv_Emission ).rgb;
			float2 uv_Mat = i.uv_texcoord * _Mat_ST.xy + _Mat_ST.zw;
			float4 temp_output_9_0 = ( _Smooth + tex2D( _Mat, uv_Mat ) );
			o.Metallic = temp_output_9_0.r;
			float2 uv_Roughness = i.uv_texcoord * _Roughness_ST.xy + _Roughness_ST.zw;
			o.Smoothness = ( tex2D( _Roughness, uv_Roughness ) + _Rough + temp_output_9_0 ).r;
			float2 uv_AO = i.uv_texcoord * _AO_ST.xy + _AO_ST.zw;
			o.Occlusion = tex2D( _AO, uv_AO ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.SamplerNode;1;-1548.655,117.1547;Inherit;True;Property;_Base;Base;0;0;Create;True;0;0;0;False;0;False;-1;19ae34997b44e4e4c96baebcf837981d;19ae34997b44e4e4c96baebcf837981d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-1579.235,548.0885;Inherit;True;Property;_Mat;Mat;2;0;Create;True;0;0;0;False;0;False;-1;074e1de1260379f458ab84bacfca41d4;074e1de1260379f458ab84bacfca41d4;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1.487026,0;Float;False;True;-1;7;ASEMaterialInspector;0;0;Standard;SirHoly/Builtin/Armor shader;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.SamplerNode;2;-1526.192,307.3315;Inherit;True;Property;_Emission;Emission;1;0;Create;True;0;0;0;False;0;False;-1;2aefcf5dc9a6492468c45c92295a98d3;2aefcf5dc9a6492468c45c92295a98d3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-1569.254,813.2144;Inherit;True;Property;_Normalmap;Normalmap;3;1;[Normal];Create;True;0;0;0;False;0;False;-1;b72ecbf0ec4af02478842e99b71d4239;b72ecbf0ec4af02478842e99b71d4239;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;5;-1554.708,1490.82;Inherit;True;Property;_Roughness;Roughness;4;0;Create;True;0;0;0;False;0;False;-1;5fcecfd467f7b764a8b06eb3b56fb14e;5fcecfd467f7b764a8b06eb3b56fb14e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;8;-1580.15,1099.843;Inherit;True;Property;_AO;AO;5;0;Create;True;0;0;0;False;0;False;-1;a30e3380751a5cd48a5031d7f249848c;a30e3380751a5cd48a5031d7f249848c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-297.3972,302.8893;Inherit;False;Property;_Rough;Rough;7;0;Create;True;0;0;0;False;0;False;0.79;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-957.5334,195.4298;Inherit;False;Property;_Smooth;Smooth;6;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-567.2325,85.76794;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;11;-147.7823,158.4091;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-473.3013,-67.92635;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;14;-927.8311,67.3303;Inherit;False;Property;_Color0;Color 0;8;0;Create;True;0;0;0;False;0;False;1,1,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;0;0;13;0
WireConnection;0;1;4;0
WireConnection;0;2;2;0
WireConnection;0;3;9;0
WireConnection;0;4;11;0
WireConnection;0;5;8;0
WireConnection;9;0;10;0
WireConnection;9;1;3;0
WireConnection;11;0;5;0
WireConnection;11;1;12;0
WireConnection;11;2;9;0
WireConnection;13;0;1;0
WireConnection;13;1;14;0
ASEEND*/
//CHKSM=3196BC0E0492B570894817303A0563D40587704F