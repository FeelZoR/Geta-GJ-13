class_name Actor
extends Entity

signal death

var _strength = 700
var _is_reloading = false
export var health = 5

onready var hit_sound = $Hit
onready var sprite = $Sprite
onready var _gun = $Sprite/Gun
onready var hitbox = $Hitbox

func damage():
	hit_sound.play()
	health -= 1
	if health <= 0:
		sprite.visible = false
		hitbox.set_deferred('disabled', true)
		emit_signal("death")

func _on_Hit_finished():
	if health <= 0:
		queue_free()
