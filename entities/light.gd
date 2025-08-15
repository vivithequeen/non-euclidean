@tool
extends SpotLight3D

var flash_timer = 0
var flash: bool = false
@export var func_godot_properties : Dictionary = {
	"rot" : Vector3(0,0,0),
}  
@export var rot : float = 0;
func _physics_process(delta: float) -> void:
	if (flash):
		if (flash_timer > 0.05):
			light_energy = randf_range(0.5, 2)
			flash_timer = 0;
		else:
			flash_timer += delta

func _ready() -> void:
	rotation.x = deg_to_rad(func_godot_properties["rot"].x)
	rotation.y = deg_to_rad(func_godot_properties["rot"].y)
	rotation.z = deg_to_rad(func_godot_properties["rot"].z)
	print(func_godot_properties)