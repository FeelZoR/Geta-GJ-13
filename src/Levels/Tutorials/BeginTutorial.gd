extends Area2D

var tutorial_img = preload("res://assets/graphics/Tutorials/beginner.png")

func _on_BeginTutorial_body_entered(body):
	if body is Player and not TutorialsList.begin_tutorial:
		TutorialsList.begin_tutorial = true
		var title = tr(Settings.BEGIN_TITLE_KEY)
		var desc = tr(Settings.BEGIN_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_img, desc)
