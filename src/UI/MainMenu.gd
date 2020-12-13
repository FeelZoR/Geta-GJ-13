extends ColorRect

var settings = preload("res://src/UI/Settings.tscn")

signal settings_closed

func _on_Start_pressed():
	get_tree().change_scene("res://src/Game.tscn")

func _on_Settings_pressed():
	var settings_node = settings.instance()
	settings_node.connect("close", self, "_on_Settings_closed")
	add_child(settings_node)
	
	yield(self, "settings_closed")
	settings_node.queue_free()
	
func _on_Settings_closed():
	emit_signal("settings_closed")

func _on_Quit_pressed():
	get_tree().quit()
