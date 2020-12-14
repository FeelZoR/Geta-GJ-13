extends Area2D

var tutorial_img = preload("res://assets/graphics/Tutorials/portal.png")

func _on_LevelTutorial_body_entered(body):
	if body is Player and not TutorialsList.level_tutorial:
		TutorialsList.level_tutorial = true
		var title = tr(Settings.LEVEL_TITLE_KEY)
		var desc = tr(Settings.LEVEL_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_img, desc)
