extends Area2D

var tutorial_img = preload("res://assets/graphics/Tutorials/boosts.png")

func _on_BoostTutorial_body_entered(body):
	if body is Player and not TutorialsList.boosts_tutorial:
		TutorialsList.boosts_tutorial = true
		var title = tr(Settings.BOOST_TITLE_KEY)
		var desc = tr(Settings.BOOST_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_img, desc)
