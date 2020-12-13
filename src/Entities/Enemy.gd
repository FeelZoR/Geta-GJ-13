class_name Enemy
extends Actor

export var max_distance = 200
export var reload_time = 1.5
var _initial_pos = 0
var _initial_scale
var _direction = 1
var _is_aiming = false

onready var _reload_timer = $ReloadTimer
onready var _aim_timer = $AimingTime

var aggro = null

func _ready():
	_initial_pos = position
	_initial_scale = sprite.scale.x
	_reload_timer.wait_time = reload_time

func _physics_process(_delta):
	var angle = null
	if aggro != null:
		if not _is_reloading:
			angle = _calculate_launch_angle()
			if angle != null:
				_look_at(aggro)
				var dir = Vector2(cos(angle), -sin(angle))
				_gun.shoot(dir, _strength, false)
				_is_reloading = true
				_is_aiming = true
				_reload_timer.start()
				_aim_timer.start()
	
	if angle == null and not _is_aiming:
		if abs(position.x - _initial_pos.x) >= max_distance:
			_update_direction()
			
		_update_animation()
		_velocity.x = speed.x * _direction
		_velocity = move_and_slide_with_snap(_velocity, Vector2.DOWN * 20, FLOOR_NORMAL)
			

func _update_direction():
	_direction *= -1

func _update_animation():
	sprite.set_animation("Walking")
	sprite.scale.x = -_initial_scale if _direction < 0 else _initial_scale

func _on_TutorialNotifier_body_entered(body):
	if body is Player and not TutorialsList.enemy_tutorial:
		TutorialsList.enemy_tutorial = true
		var title = tr(Settings.ENEMY_TITLE_KEY)
		var desc = tr(Settings.ENEMY_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, null, desc)

##### PLAYER ATTACK #####
func _look_at(player):
	sprite.scale.x = -_initial_scale if player.position.x < position.x else _initial_scale
	sprite.set_animation("Idle")
	
func _calculate_launch_angle():
	var pos = aggro.global_position - _gun.global_position
	var v = _strength
	var g = gravity
	
	var root1 = atan2(pow(v, 2) + sqrt(pow(v, 4) - g * (g*pow(pos.x, 2) + 2 * -pos.y * pow(v, 2))), g * pos.x)
	var root2 = atan2(pow(v, 2) - sqrt(pow(v, 4) - g * (g*pow(pos.x, 2) + 2 * -pos.y * pow(v, 2))), g * pos.x)
	
	if is_nan(root1):
		if is_nan(root2):
			return null
		else:
			return root2
	elif is_nan(root2):
		return root1
	
	return root2 if abs(root1) > abs(root2) else root1

func _on_PlayerVisibility_body_entered(body):
	if body is Player:
		aggro = body

func _on_PlayerVisibility_body_exited(body):
	if body is Player:
		aggro = null

func _on_ReloadTimer_timeout():
	_is_reloading = false

func _on_AimingTime_timeout():
	_is_aiming = false
