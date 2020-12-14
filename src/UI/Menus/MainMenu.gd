extends ColorRect

onready var click_sound = $Click
var settings = preload("res://src/UI/Menus/Settings/Settings.tscn")

signal settings_closed
signal click_sound

func _on_Start_pressed():
	click_sound.play()
	yield(self, "click_sound")
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
	click_sound.play()
	yield(self, "click_sound")
	get_tree().quit()

func _on_Click_finished():
	emit_signal("click_sound")
