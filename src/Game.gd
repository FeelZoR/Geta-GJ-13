extends Node2D

onready var effect_countdown = $HUD/Effect_Countdown
onready var effect_icon = $HUD/Effect_Icon
onready var tutorial = $HUD/Tutorial

func _ready():
	randomize()

func set_effect(time, res):
	effect_countdown.set_effect(time)
	effect_icon.set_sprite_frames(res)
	effect_countdown.visible = true
	effect_icon.visible = true

func end_boost():
	effect_countdown.visible = false
	effect_icon.visible = false

func start_tutorial(title, img, desc):
	tutorial.visible = true
	tutorial.start_tutorial(title, img, desc)
	get_tree().paused = true
	
func stop_tutorial():
	tutorial.visible = false
	get_tree().paused = false
