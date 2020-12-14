extends "res://src/Items/Boost.gd"

var tutorial_img = preload("res://assets/graphics/Tutorials/strength_powerup.png")

func pickup(player):
	var time = rand_range(MIN_TIME, MAX_TIME)
	player.boost(Settings.STRENGTH_BOOST, time, 150)
	get_tree().get_current_scene().set_effect(time, Settings.strength_animation)
	.pickup(player)
	_start_tutorial()

func _start_tutorial():
	if not TutorialsList.strength_boost_tutorial:
		TutorialsList.strength_boost_tutorial = true
		var title = tr(Settings.STRENGTH_TITLE_KEY)
		var desc = tr(Settings.STRENGTH_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_img, desc)
