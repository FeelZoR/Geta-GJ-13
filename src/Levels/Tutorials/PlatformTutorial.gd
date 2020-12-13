extends Area2D

var tutorial_img = preload("res://assets/graphics/Tutorials/platform.png")

func _on_PlatformTutorial_body_entered(body):
	if body is Player and not TutorialsList.platform_tutorial:
		TutorialsList.platform_tutorial = true
		var title = tr(Settings.PLATFORM_TITLE_KEY)
		var desc = tr(Settings.PLATFORM_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_img, desc)

