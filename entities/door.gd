@tool
extends StaticBody3D

var height : float = 3.5;
var start_pos : Vector3



var is_open : bool = false

@export var update : bool :
	set(value):
		update_doors()
		reset()
		

@export var close : bool :
	set(value):
		close_door()
@export var open : bool :
	set(value):
		open_door()


@export var default_open : bool

func _ready() -> void:
	update_doors()

func update_doors():

	

	if(default_open and !Engine.is_editor_hint()):
		open_door()

	start_pos = global_position


func reset():
	position = start_pos
	is_open = false

func open_door():
	if(!is_open):
		is_open = true;
		var tween = get_tree().create_tween()
		var end = position.y - height
		tween.tween_property(self,"position:y",end,1.4)

func close_door():
	if(is_open):
		is_open = false;
		var tween = get_tree().create_tween()
		var end = position.y + height
		tween.tween_property(self,"position:y",end,1.4)

func interact():
	open_door()