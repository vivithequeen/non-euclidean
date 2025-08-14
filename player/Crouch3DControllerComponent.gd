extends Node
class_name Crouch3DControllerComponent

@export var crouchcast : RayCast3D
@export var characterBody : CharacterBody3D
@export var camera : Camera3D
@export var collider : CollisionShape3D

@export var headbob3DControllerComponent : Headbob3DControllerComponent
var is_crouching = true




func crouch(delta, input_dir):
	is_crouching = Input.is_action_pressed("crouch") and characterBody.is_on_floor();
	if crouchcast.is_colliding() and !is_crouching:
		is_crouching = true
	
	collider.shape.height = 1 if is_crouching else 2;
	collider.position.y = -0.5 if is_crouching else 0.0
	var tween = get_tree().create_tween()

	var headbob_position = headbob3DControllerComponent.headbob(delta, input_dir);
	tween.tween_property(camera, "position:y", (0 if is_crouching else 1) + headbob_position.y, 0.09)
	camera.position.x = headbob_position.x
