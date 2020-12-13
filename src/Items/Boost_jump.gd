extends "res://src/Items/Boost.gd"

var tutorial_img = preload("res://assets/graphics/Tutorials/jump_powerup.png")

func pickup(player):
	var time = rand_range(MIN_TIME, MAX_TIME)
	player.boost(Settings.JUMP_BOOST, time, 150)
	get_tree().get_current_scene().set_effect(time, Settings.jump_animation)
	.pickup(player)
	_start_tutorial()

func _start_tutorial():
	if not TutorialsList.jump_boost_tutorial:
		TutorialsList.jump_boost_tutorial = true
		var title = tr(Settings.JUMP_TITLE_KEY)
		var desc = tr(Settings.JUMP_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_img, desc)
