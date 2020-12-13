extends Area2D

const MIN_TIME = 5
const MAX_TIME = 15

func _on_Boost_body_entered(body):
	if body is Player:
		pickup(body)

func pickup(_player):
	$Sound.play()
	$Sprite.visible = false
	$Hitbox.set_deferred('disabled', true)

func _on_Sound_finished():
	queue_free()
