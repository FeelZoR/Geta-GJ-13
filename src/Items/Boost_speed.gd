extends "res://src/Items/Boost.gd"

func pickup(player):
	var time = rand_range(MIN_TIME, MAX_TIME)
	player.boost(Settings.SPEED_BOOST, time, 100)
	get_tree().get_current_scene().set_effect(time, Settings.speed_animation)
	.pickup(player)
