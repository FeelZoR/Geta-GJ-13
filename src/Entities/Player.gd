class_name Player
extends Entity

const FLOOR_DETECTION_DISTANCE = 20
var _strength = 700
var _is_reloading = false

onready var _sprite = $Sprite
onready var _platform_collider = $FloorCollider
onready var _gun = $Sprite/Gun
onready var _boost_timer = $BoostTimer

var _boost_locked = false
signal resume_boost
signal start_boost

func _physics_process(_delta):
	var direction = _get_direction()
	_velocity = calculate_move_velocity(_velocity, direction)
	
	var is_on_platform = _platform_collider.is_colliding()
	var snap_vector = Vector2.DOWN * FLOOR_DETECTION_DISTANCE if direction.y == 0.0 else Vector2.ZERO
	_velocity = move_and_slide_with_snap(_velocity, snap_vector, FLOOR_NORMAL, not is_on_platform)
	
	_update_animation(direction)
	
func _input(event):
	if event.is_action_pressed("shoot") and not _is_reloading:
		var direction = Vector2.ZERO
		if event.button_index == BUTTON_LEFT:
			direction = get_global_mouse_position() - _gun.global_position
		else:
			direction = Vector2(Input.get_joy_axis(0, JOY_ANALOG_LX),
								Input.get_joy_axis(0, JOY_ANALOG_LY))
		_mirror(direction)
		_gun.shoot(direction, _strength)
		_is_reloading = true
		$ReloadTimer.start()

######## MOVEMENT ########
func _get_direction():
	var jumping = Input.get_action_strength("jump") >= Settings.JUMP_THRESHOLD
	
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1 if jumping && is_on_floor() else 0
	)

func calculate_move_velocity(curr_velocity, direction):
	var velocity = curr_velocity
	velocity.x = speed.x * direction.x
	
	if direction.y != 0.0:
		velocity.y = speed.y * direction.y
		
	return velocity

######## ANIMATION ########
func _update_animation(direction):
	_mirror(direction)
	_change_idling(direction)
	
func _change_idling(direction):
	if direction.x == 0.0:
		_sprite.set_animation("Idle")
	else:
		_sprite.set_animation("Walking")

func _mirror(direction):
	if direction.x != 0.0:
		_sprite.scale.x = -1 if direction.x < 0 else 1

func _on_ReloadTimer_timeout():
	_is_reloading = false

######## BOOST ########
func boost(type, time, val):
	while _boost_locked:
		call_deferred("resume_boost") # Allows us to yield before the signal is sent
		yield(self, "start_boost")
	
	_start_boost(type, time, val)

func resume_boost():
	emit_signal("resume_boost")

func _start_boost(type, time, val):
	_boost_locked = true
	if type == Settings.JUMP_BOOST:
		speed.y += val
	elif type == Settings.SPEED_BOOST:
		speed.x += val
	elif type == Settings.STRENGTH_BOOST:
		_strength += val
		
	_boost_timer.wait_time = time
	_boost_timer.start()
		
	yield(self, "resume_boost")
	
	if type == Settings.JUMP_BOOST:
		speed.y -= val
	elif type == Settings.SPEED_BOOST:
		speed.x -= val
	elif type == Settings.STRENGTH_BOOST:
		_strength -= val
		
	_boost_locked = false
	emit_signal("start_boost")
	
func _on_BoostTimer_timeout():
	emit_signal("resume_boost")
