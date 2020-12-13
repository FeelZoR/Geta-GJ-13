extends "res://src/Items/Boost.gd"

func pickup(player):
	var time = rand_range(MIN_TIME, MAX_TIME)
	player.boost(Settings.STRENGTH_BOOST, time, 150)
	get_tree().get_current_scene().set_effect(time, Settings.strength_animation)
	.pickup(player)
