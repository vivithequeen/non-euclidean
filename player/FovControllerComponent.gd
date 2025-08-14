extends Node
class_name FovControllerComponent

@export var camera : Camera3D
@export var sprint3DControllerComponent : Sprint3DControllerComponent

func fov(input_dir):
	var current_fov : float = 90;

	current_fov += (6 if input_dir.y else 0)
	current_fov += (8 if sprint3DControllerComponent.is_sprint else 0)
	var tween = get_tree().create_tween()
	tween.tween_property(camera, "fov", current_fov, 0.2)
