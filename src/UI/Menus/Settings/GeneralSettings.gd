extends Panel

onready var language = $Center/Container/Localization/Value
onready var easy = $Center/Container/Difficulty/Group/Easy
onready var medium = $Center/Container/Difficulty/Group/Medium
onready var hard = $Center/Container/Difficulty/Group/Hard
onready var aim_position = $Center/Container/Aim/Group/Position
onready var aim_angle = $Center/Container/Aim/Group/Angle
onready var click_sound = $Click

func _ready():
	var i = 0
	while i < language.get_item_count() and language.get_item_text(i) != "language_" + TranslationServer.get_locale():
		i += 1
	
	if i < language.get_item_count():
		language.select(i)
	
	if Settings.difficulty == Settings.EASY_DIFF:
		easy.pressed = true
	elif Settings.difficulty == Settings.MEDIUM_DIFF:
		medium.pressed = true
	elif Settings.difficulty == Settings.HARD_DIFF:
		hard.pressed = true
	
	if Settings.aim == Settings.POSITION_AIM:
		aim_position.pressed = true
	else:
		aim_angle.pressed = true

func save():
	var locale = language.get_item_text(language.get_selected_id()).replace('language_', '')
	TranslationServer.set_locale(locale)
	
	var diff = Settings.EASY_DIFF
	if medium.is_pressed():
		diff = Settings.MEDIUM_DIFF
	elif hard.is_pressed():
		diff = Settings.HARD_DIFF
		
	var aim = Settings.POSITION_AIM
	if aim_angle.is_pressed():
		aim = Settings.ANGLE_AIM
	
	Settings.difficulty = diff
	Settings.aim = aim

func _on_pressed():
	click_sound.play()

func _on_Value_item_selected(index):
	click_sound.play()

func set_in_game():
	easy.disabled = true
	medium.disabled = true
	hard.disabled = true
