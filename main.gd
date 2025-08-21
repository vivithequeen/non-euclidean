extends Node


var fullbright_toggle = [0];

var draw_mode_open = [true]

var draw_mode_current = []
var draw_mode_options = ["default", "unshaded", "lighting","overdraw","wireframe","normal"]
@export var level_viewport: SubViewport
func _process(delta):
	
	mainMenuBar()
	draw_mode()
	ImGui.Begin("Debug")
	#if (ImGui.Checkbox("fullbright", fullbright_toggle)):
	#	level_viewport.debug_draw = (Viewport.DEBUG_DRAW_UNSHADED if fullbright_toggle[0] else Viewport.DEBUG_DRAW_DISABLED)
	#ImGui.Text("hello from GDScript")
	if (ImGui.Button("Reset")):
		get_tree().reload_current_scene()
	ImGui.End()
	

func draw_mode():
	ImGui.Begin("Draw Mode", draw_mode_open)

	if(ImGui.Combo("Draw Modes", draw_mode_current,draw_mode_options)):
		
		level_viewport.debug_draw = draw_mode_current[0]
	ImGui.End()

func mainMenuBar():
	ImGui.BeginMainMenuBar();
	ImGui.Text("fps: " + str(Engine.get_frames_per_second()))
	ImGui.EndMainMenuBar();
