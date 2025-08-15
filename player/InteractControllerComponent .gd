extends Node
class_name InteractControllerComponent
var collider

@export var interact_cast : RayCast3D
@export var tooltip : Control
func _input(event: InputEvent) -> void:
	if(collider and (interact_cast.is_colliding() || collider != interact_cast.get_collider())):
		if(collider.get("current")):
			collider.current = false
		collider = null
	if interact_cast.is_colliding() and interact_cast.get_collider().get("tooltip"):
		
		collider = interact_cast.get_collider()
		collider.current = true
		tooltip.text = collider.get("tooltip")

		if collider.get("raycast_active") and event.is_action_pressed("interact"):
			collider.interact()
	else:
		tooltip.text = ""
