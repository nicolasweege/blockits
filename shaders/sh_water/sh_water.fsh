varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelh;
uniform float pixelw;
uniform float springs[2000];
uniform float time;
uniform float fizzle;
uniform float spring_count;

void main()
{
	vec2 p = v_vTexcoord;
	float py = 1.0 - p.y;
	float pixel_is_in = (p.x / pixelw);
	int chunk = int(floor(p.x * spring_count));
	int next_chunk = int(min(floor(p.x * spring_count) + 1.0, 99.0));
	float chunk_percent = (p.x * spring_count) - float(p.x * spring_count);
	p.y = p.y + ((sin((pixel_is_in * 0.1) + time) * (1.5 * pixelh)) * py);
	p.y = p.y + ((sin((pixel_is_in * 0.15) - time * 1.2) * (1.5 * pixelh)) * py);
	p.y = p.y + (mix(springs[chunk] * pixelh, springs[next_chunk] * pixelh, chunk_percent) * py);
	p.y = max(p.y, 0.0);
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, p);
}