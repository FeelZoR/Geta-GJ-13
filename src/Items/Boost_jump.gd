extends "res://src/Items/Boost.gd"

func pickup(player):
	var time = rand_range(MIN_TIME, MAX_TIME)
	player.boost(Settings.JUMP_BOOST, time, 150)
	get_tree().get_current_scene().set_effect(time, Settings.jump_animation)
	.pickup(player)
