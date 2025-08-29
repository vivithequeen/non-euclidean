extends Node
class_name CameraControllerComponent

@export var camera : Node3D
@export var hide : Control
func _physics_process(delta: float) -> void:
    var tween = get_tree().create_tween()
    var pos = Vector3(-0.007,-0.054,-0.381) if Input.is_action_pressed("look_camera") else Vector3(0.361,-0.336,-0.667)
    tween.tween_property(camera, "position",pos,0.1)
    hide.visible = !Input.is_action_pressed("look_camera")