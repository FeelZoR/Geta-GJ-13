extends Control


func start_tutorial(title, image, desc):
	$Card/Title.text = title
	$Card/Image.texture = image
	$Card/Description.text = desc
	$Animation.play("move")

func finish():
	get_tree().get_current_scene().stop_tutorial()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		finish()

func _on_Button_pressed():
	finish()
