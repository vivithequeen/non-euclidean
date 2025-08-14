extends Node
class_name Sprint3DControllerComponent

@export var crouch3DControllerComponent : Crouch3DControllerComponent

var is_sprint : bool = false

func _physics_process(delta):
	is_sprint = Input.is_action_pressed("sprint") and !crouch3DControllerComponent.is_crouching
