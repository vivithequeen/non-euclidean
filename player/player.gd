extends CharacterBody3D


const SPEED = 4.3
const JUMP_VELOCITY = 3.5

@export var cam3DControllerComponent : Cam3DControllerComponent
@export var fovControllerComponent : FovControllerComponent
@export var crouch3DControllerComponent : Crouch3DControllerComponent
@export var sprint3DControllerComponent : Sprint3DControllerComponent
func _ready():
	randomize()
func _physics_process(delta: float) -> void:
	$Camera3D/ui/Label.text = "fps: " + str(Engine.get_frames_per_second())
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var is_crouching : bool= crouch3DControllerComponent.crouch(delta,input_dir)
	if direction:
		velocity.x = direction.x * SPEED * (0.5 if is_crouching else 1.0) * (1.35 if sprint3DControllerComponent.is_sprint else 1.0)
		velocity.z = direction.z * SPEED * (0.5 if is_crouching else 1.0) * (1.35 if sprint3DControllerComponent.is_sprint else 1.0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	cam3DControllerComponent.camera_sway(input_dir)
	fovControllerComponent.fov(input_dir)
	velocity.y = clamp(velocity.y,-20,20)
	move_and_slide()
