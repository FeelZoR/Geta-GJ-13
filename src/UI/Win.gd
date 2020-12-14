extends ColorRect

onready var text = $Text
onready var visibility = $Text/Visibility

func _ready():
	visibility.set_rect(Rect2(Vector2.ZERO, text.rect_size))

func close():
	get_tree().change_scene("res://src/UI/Menus/MainMenu.tscn")

func _input(event):
	if event.is_action_pressed("pause"):
		close()

func _on_Visibility_screen_exited():
	close()
