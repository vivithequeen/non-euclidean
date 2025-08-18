extends Node


# Called when the node enters the scene tree for the first time.
func _process(delta):
	ImGui.Begin("My Window")
	#ImGuiIO io = ImGui.GetIO()
	var fullbright_toggle = [];
	ImGui.Checkbox("fullbright", fullbright_toggle)
	ImGui.Text("hello from GDScript")
	ImGui.End()
	
