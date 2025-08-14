extends Node
class_name Headbob3DControllerComponent


var headbob_timer = 0.0;
var headbob_speed = 6.0;
var headbob_distance = 0.07;


@export var camera: Camera3D


func headbob(delta: float, input_dir: Vector2) -> Vector3:
	if (input_dir):
		headbob_timer += delta;
		if (headbob_timer > (PI / headbob_speed)):
			headbob_timer = 0
	else:
		if (headbob_timer < PI):
			headbob_timer += delta;
	var headbob_position = Vector3.ZERO

	headbob_position.y = sin(headbob_timer * headbob_speed) * headbob_distance
	headbob_position.x = cos(headbob_timer * headbob_speed / 2) * headbob_distance
	return headbob_position
