extends Area2D

var tutorial_img = preload("res://assets/graphics/Tutorials/enemy.png")

func _on_BlockedTutorial_body_entered(body):
	if body is Player and not TutorialsList.opening_tutorial:
		TutorialsList.opening_tutorial = true
		var title = tr(Settings.OPENING_TITLE_KEY)
		var desc = tr(Settings.OPENING_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_img, desc)
