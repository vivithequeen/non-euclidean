extends Area3D
@export var active : bool =true 
@export var activate_objects : Array[Node]

func interact():

	if(active):

		for i in activate_objects:
			i.interact()
		active = false

func _on_body_entered(body:Node3D) -> void:
	print(body)
	if(body.get("is_box")):
		interact()
		$CollisionShape3D.disabled = false;
		$MeshInstance3D.visible = true
		body.queue_free()
