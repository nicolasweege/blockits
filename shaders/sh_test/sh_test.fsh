varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelh;
uniform float pixelw;
// uniform float springs[2000];
// uniform float time;
// uniform float fizzle;
// uniform float spring_count;

void main()
{
	vec2 p = v_vTexcoord;
	float py = 1.0 - p.y;
	float pixel_is_in = (p.x / pixelw);
	p.y = max(p.y, 0.0);
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, p);
}