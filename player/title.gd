extends Label




func show_title(title_text : String):
	text = title_text
	var tween = get_tree().create_tween()
	tween.tween_property(material, "shader_parameter/progress", 0, 2)
	tween.tween_interval(2)
	tween.tween_property(material, "shader_parameter/progress", 1, 2)