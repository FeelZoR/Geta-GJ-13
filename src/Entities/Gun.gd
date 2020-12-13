extends Position2D

var projectile = preload("res://src/Entities/Projectile.tscn")
onready var sound = $Sound

func shoot(direction, strength, friendly):
	var snowball = projectile.instance()
	snowball.global_position = global_position
	snowball.launch(direction.normalized() * strength, friendly)
	get_node("/root/Game/Projectiles").add_child(snowball)
	sound.play()
