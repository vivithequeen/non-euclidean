extends Node3D
var shader : Shader= load("res://resources/shaders/highlight.gdshader")

@export var can_deactiate : bool = false
@export var active : bool =true 
@export var raycast_active : bool = true
@export var animationPlayer : AnimationPlayer
@export var debounce_length : float = 0;
@export var activate_objects : Array[Node]


var current : bool = false;
var tooltip = "press [e] to activate"


var can : bool = true

func _ready() -> void:
	$Lever_Base.material_overlay = ShaderMaterial.new()
	$Node3D/Lever_Top.material_overlay = ShaderMaterial.new()

	$Lever_Base.material_overlay.shader = shader
	$Node3D/Lever_Top.material_overlay.shader = shader

	$Lever_Base.material_overlay.set_shader_parameter("_Color" ,Color.WHITE)
	$Node3D/Lever_Top.material_overlay.set_shader_parameter("_Color" ,Color.WHITE)

func interact():
	if(can):
		if(active):
			animationPlayer.play("switch")
			for i in activate_objects:
				i.interact()
			active = false
			can = false;
			$Timer.wait_time = debounce_length;
			$Timer.start()

		else:
			if(can_deactiate):
				animationPlayer.play_backwards("switch")
				for i in activate_objects:
					i.deactiate()
				active = true


func _physics_process(_delta: float) -> void:
	$Lever_Base.material_overlay.set_shader_parameter("active" ,current)
	$Node3D/Lever_Top.material_overlay.set_shader_parameter("active" ,current)


func _on_timer_timeout() -> void:
	can = true
