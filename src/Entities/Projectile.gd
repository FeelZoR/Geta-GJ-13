class_name Projectile
extends Entity

func launch(velocity):
	_velocity = velocity
	if _velocity.x < 0:
		$Sprite.scale.x = -1

func _physics_process(delta):
	var collision = move_and_collide(_velocity * delta)
	if collision != null:
		var collider = collision.collider
		if collider is Enemy:
			collider.damage()
		if not collider is Player:
			queue_free()
