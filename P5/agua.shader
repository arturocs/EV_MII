shader_type spatial;


void vertex() {
	VERTEX = vec3(VERTEX.x*max(sin(TIME*VERTEX.y), 0.75), VERTEX.y, VERTEX.z*max(sin(TIME*VERTEX.y), 0.75));
}
void fragment() {
	vec3 azul = vec3(0.1, 1, 0.9);
	float transparencia = 0.1;
	vec3 rand_color = vec3(cos(TIME*VERTEX.z*10.0)*sin(TIME*VERTEX.x*2.0), 1,1);
	ALBEDO = max(rand_color, azul);
	ALPHA = transparencia;
}

