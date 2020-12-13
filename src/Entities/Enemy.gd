class_name Enemy
extends Entity

export var move_time = 2
export var health = 5
var _time_left = 0
var _direction = 1

onready var sprite = $Sprite
onready var hitbox = $Hitbox
onready var hit_sound = $Hit

func _ready():
	_time_left = move_time

func _physics_process(delta):
	_time_left -= delta
	if _time_left < 0:
		_update_direction()
		_time_left = move_time
		
	_velocity.x = speed.x * _direction
	_velocity = move_and_slide_with_snap(_velocity, Vector2.DOWN * 20, FLOOR_NORMAL)

func _update_direction():
	_direction *= -1
	sprite.set_flip_h(_direction < 0)

func damage():
	hit_sound.play()
	health -= 1
	if health <= 0:
		sprite.visible = false
		hitbox.set_deferred('disabled', true)

func _on_TutorialNotifier_body_entered(body):
	if body is Player and not TutorialsList.enemy_tutorial:
		TutorialsList.enemy_tutorial = true
		var title = tr(Settings.ENEMY_TITLE_KEY)
		var desc = tr(Settings.ENEMY_DESC_KEY)
		get_tree().get_current_scene().start_tutorial(title, null, desc)
		
func _on_Hit_finished():
	if health <= 0:
		queue_free()
