shader_type spatial;
render_mode cull_disabled;



uniform float scale = 1;




uniform sampler2D albedo: source_color;



mat3 rotateX(float theta)
{
	
	float cosa = cos(theta);
	float sina = sin(theta);

 
    //Y rotation	
	mat3 rotate_x  = mat3(
	   vec3(1.0, 0.0, 0.0),
	   vec3(0.0, cosa, -sina),
	   vec3(0.0, sina, cosa)
	);
	
	return rotate_x;
}

void vertex()
{

	float x = sin(VERTEX.x / scale);
	mat3 rotation_matrix =  rotateX(x) ;
	vec3 rotated_vertex =  rotation_matrix * VERTEX;
	vec3 rotated_normals =  rotation_matrix * NORMAL;

	VERTEX =  rotated_vertex;
	NORMAL =  rotated_normals;
	

}

void fragment()
{
	ALBEDO = texture(albedo, UV).rgb;	
	
}