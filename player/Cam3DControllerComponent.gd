extends Node
class_name Cam3DControllerComponent

@export var sprint3DControllerComponent : Sprint3DControllerComponent
const LOOKSENSE: float = 0.0025 *4

## CharacterBody3D that the controller is acting on
@export var actor: CharacterBody3D

## Camera3D that the controller is acting on, should preferably be the
## controller's parent
@export var camera: Camera3D

## Max wait time after pressing escape to be able to press escape again
@export var max_camera_debounce: int = 10


var paused: bool = false
var debounce: int = 0


func _ready():
	if not actor:
		actor = get_parent().get_parent()
	
	if not camera:
		camera = get_parent()


func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE) and debounce == 0:
		paused = not paused
		debounce = max_camera_debounce
	
	if event is InputEventMouseMotion and not paused:
		actor.rotation.y+=(-event.relative.x * LOOKSENSE)
		camera.rotation.x +=(-event.relative.y * LOOKSENSE)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)


func _physics_process(delta):
	if debounce > 0:
		debounce -= 1
	
	update_mouse_mode()


func update_mouse_mode():
	if paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func camera_sway(input_dir):
	var tween = get_tree().create_tween()
	tween.tween_property(camera, "rotation:z", ((deg_to_rad(-5.5 if sprint3DControllerComponent.is_sprint else -2.5) * input_dir.x) if input_dir else 0), 0.2)
	tween.set_parallel()
