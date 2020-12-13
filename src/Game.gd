extends Node2D

onready var effect_countdown = $HUD/Effect_Countdown
onready var effect_icon = $HUD/Effect_Icon
onready var tutorial = $HUD/Tutorial
onready var pause = $HUD/PauseMenu
onready var _health_bar = $HUD/Health_bar

func _ready():
	randomize()
	_health_bar.setup_bar(5)
	
func damage_player():
	_health_bar.remove_heart()
	
##### BOOSTS #####

func set_effect(time, res):
	effect_countdown.set_effect(time)
	effect_icon.set_sprite_frames(res)
	effect_countdown.visible = true
	effect_icon.visible = true

func end_boost():
	effect_countdown.visible = false
	effect_icon.visible = false

##### TUTORIALS #####

func start_tutorial(title, img, desc):
	tutorial.visible = true
	tutorial.start_tutorial(title, img, desc)
	get_tree().paused = true
	
func stop_tutorial():
	tutorial.visible = false
	get_tree().paused = false

##### PAUSE #####

func _pause():
	$Level/BGM.pause_mode = Node.PAUSE_MODE_STOP
	pause.visible = true
	get_tree().paused = true

func _unpause():
	pause.visible = false
	$Level/BGM.pause_mode = Node.PAUSE_MODE_PROCESS
	get_tree().paused = false

func _on_PauseMenu_resume():
	_unpause()
