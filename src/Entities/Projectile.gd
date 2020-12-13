class_name Projectile
extends Entity

func launch(velocity):
	_velocity = velocity

func _physics_process(delta):
	var collision = move_and_collide(_velocity * delta)
	_update_animation()
	if collision != null:
		var collider = collision.collider
		if collider is Enemy:
			collider.damage()
		if not collider is Player:
			queue_free()

func _update_animation():
	$Sprite.rotation = _velocity.angle()
