extends Node
class_name Headbob3DControllerComponent


@export var sprint3DControllerComponent : Sprint3DControllerComponent
var headbob_speed := 6.0;
var headbob_timer = PI;
var headbob_distance = 0.07;



func headbob(delta: float, input_dir: Vector2) -> Vector3:
	if (input_dir):
		headbob_timer += delta * headbob_speed/2.0 * (2 if sprint3DControllerComponent.is_sprint else 1);
		if (headbob_timer > (PI*2)):
			headbob_timer = 0
	else:
		if (headbob_timer <= (PI)):
			headbob_timer += delta * headbob_speed*2.0;
	var headbob_position = Vector3.ZERO

	headbob_position.y = sin(headbob_timer*2) * headbob_distance * (1.3 if sprint3DControllerComponent.is_sprint else 1.0) 
	headbob_position.x = cos(headbob_timer) * headbob_distance * (1.3 if sprint3DControllerComponent.is_sprint else 1.0)
	return headbob_position
