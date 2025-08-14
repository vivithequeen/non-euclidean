extends SpotLight3D

var flash_timer = 0
@export var flash: bool = false
func _physics_process(delta: float) -> void:
	if (flash):
		if (flash_timer > 0.05):
			light_energy = randf_range(0.5, 2)
			flash_timer = 0;
		else:
			flash_timer += delta
