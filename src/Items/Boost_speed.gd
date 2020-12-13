extends "res://src/Items/Boost.gd"

var tutorial_img = preload("res://assets/graphics/Tutorials/speed_powerup.png")

func pickup(player):
	var time = rand_range(MIN_TIME, MAX_TIME)
	player.boost(Settings.SPEED_BOOST, time, 100)
	get_tree().get_current_scene().set_effect(time, Settings.speed_animation)
	.pickup(player)
	_start_tutorial()

func _start_tutorial():
	if not TutorialsList.speed_boost_tutorial:
		TutorialsList.speed_boost_tutorial = true
		var title = tr(Settings.SPEED_TITLE_KEY)
		var desc = tr(Settings.SPEED_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_img, desc)
