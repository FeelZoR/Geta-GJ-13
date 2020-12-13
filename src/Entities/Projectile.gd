class_name Projectile
extends Entity

func launch(velocity, friendly):
	_velocity = velocity
	if friendly:
		set_collision_layer(Settings.FRIENDLY_PROJECTILE_LAYER)
		set_collision_mask(Settings.MOVEMENT_LAYER + Settings.ENEMY_LAYER)
	else:
		set_collision_layer(Settings.ENEMY_PROJECTILE_LAYER)
		set_collision_mask(Settings.MOVEMENT_LAYER + Settings.PLAYER_LAYER)

func _physics_process(delta):
	var collision = move_and_collide(_velocity * delta)
	_update_animation()
	if collision != null:
		var collider = collision.collider
		if collider is Actor:
			collider.damage()
		queue_free()

func _update_animation():
	$Sprite.rotation = _velocity.angle()
