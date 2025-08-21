extends Area3D

var activeated : bool = false
@export var func_godot_properties : Dictionary = {}

func _ready() -> void:
	body_entered.connect(_body_entered)


func _body_entered(body : Node3D):
	if(!activeated and body.get("is_player")):
		activeated = true
		get_tree().call_group("title","show_title",func_godot_properties["title_text"])
