//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_emission;

void main()
{
	vec4 col_tex = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
    gl_FragColor = vec4(col_tex.rgb*u_emission, col_tex.a);
}
