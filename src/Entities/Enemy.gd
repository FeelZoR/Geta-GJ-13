class_name Enemy
extends Actor

var tutorial_image = preload("res://assets/graphics/Tutorials/enemy.png")

const EASY_AIM_RANGE = PI/4
const MEDIUM_AIM_RANGE = PI/6
var _aim_range = 0

export var max_distance = 200
export var reload_time = 1.5
var _initial_pos = 0
var _initial_scale
var _direction = 1
var _is_aiming = false
var _is_hurt = false

onready var _reload_timer = $ReloadTimer
onready var _aim_timer = $AimingTime
onready var _invincibility_timer = $InvincibilityTimer

var aggro = null

func _ready():
	_initial_pos = position
	_initial_scale = sprite.scale.x
	_reload_timer.wait_time = reload_time
	
	if Settings.difficulty == Settings.EASY_DIFF:
		_aim_range = EASY_AIM_RANGE
	elif Settings.difficulty == Settings.MEDIUM_DIFF:
		_aim_range = MEDIUM_AIM_RANGE

func _physics_process(_delta):
	var angle = null
	if aggro != null:
		if not _is_reloading:
			angle = Utils.calculate_launch_angle(_gun.global_position, aggro.global_position, _strength, gravity, Settings.difficulty != Settings.EASY_DIFF)
			if angle != null:
				if _aim_range != 0:
					angle = rand_range(angle - _aim_range, angle + _aim_range)
				_look_at(aggro)
				var dir = Vector2(cos(angle), -sin(angle))
				_gun.shoot(dir, _strength, false)
				_is_reloading = true
				_is_aiming = true
				_reload_timer.start()
				_aim_timer.start()
	
	if angle == null and not _is_aiming and not _is_hurt:
		if abs(position.x - _initial_pos.x) >= max_distance:
			_update_direction()
			
		_update_animation()
		_velocity.x = speed.x * _direction
	else:
		_velocity.x = 0
	
	_velocity = move_and_slide_with_snap(_velocity, Vector2.DOWN * 20, FLOOR_NORMAL)
			

func _update_direction():
	_direction *= -1

func _on_TutorialNotifier_body_entered(body):
	if body is Player and not TutorialsList.enemy_tutorial:
		TutorialsList.enemy_tutorial = true
		var title = tr(Settings.ENEMY_TITLE_KEY)
		var desc = tr(Settings.ENEMY_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, tutorial_image, desc)

##### ANIMATION #####
func _look_at(player):
	sprite.scale.x = -_initial_scale if player.position.x < position.x else _initial_scale
	sprite.set_animation("Idle")
	
func _update_animation():
	sprite.set_animation("Walking")
	sprite.scale.x = -_initial_scale if _direction < 0 else _initial_scale
	
func _play_hurt():
	sprite.set_animation("Hurt")
	sprite.set_frame(0)
	_is_hurt = true

func _stop_hurt():
	sprite.set_animation("Walking")
	_is_hurt = false

##### PLAYER ATTACK #####

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

func damage():
	.damage()
	_play_hurt()
	_make_invincible()

func _make_invincible():
	set_collision_layer(0)
	set_collision_mask(Settings.MOVEMENT_LAYER)
	_invincibility_timer.start()

func _on_InvincibilityTimer_timeout():
	set_collision_layer(Settings.ENEMY_LAYER)
	set_collision_mask(Settings.MOVEMENT_LAYER + Settings.FRIENDLY_PROJECTILE_LAYER)
	_stop_hurt()
