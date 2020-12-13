extends Area2D

const MIN_TIME = 5
const MAX_TIME = 15

func _on_Boost_body_entered(body):
	if body is Player:
		pickup(body)

func pickup(player):
	$Sound.play()
	queue_free()
