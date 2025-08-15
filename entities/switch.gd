extends Node3D
@export var active : bool =true 
@export var raycast_active : bool = true
@export var animationPlayer : AnimationPlayer

@export var activate_objects : Array[Node3D]


var current : bool = false;
var tooltip = "press [e] to activate"
func interact():

	if(active):
		animationPlayer.play("switch")
		for i in activate_objects:
			i.interact()
		active = false

func _physics_process(_delta: float) -> void:
	$Lever_Base.material_overlay.set_shader_parameter("active" ,current)
	$Node3D/Lever_Top.material_overlay.set_shader_parameter("active" ,current)
