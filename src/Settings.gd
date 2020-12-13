extends Node

const JUMP_BOOST = 'jump'
const STRENGTH_BOOST = 'strength'
const SPEED_BOOST = 'speed'

const JUMP_THRESHOLD = 0.9

var speed_animation = preload("res://assets/graphics/Level/Items/Anim_bst_speed.tres")
var strength_animation = preload("res://assets/graphics/Level/Items/Anim_bst_strength.tres")
var jump_animation = preload("res://assets/graphics/Level/Items/Anim_bst_jump.tres")

##### SOUNDS #####
const MASTER_BUS = "Master"
const BGM_BUS = "BGM"
const SFX_BUS = "SFX"
const UI_BUS = "UI Sounds"

##### LOCALIZATION #####
const ENEMY_TITLE_KEY 			= "enemy_tutorial_title"
const ENEMY_DESC_KEY 			= "enemy_tutorial_desc"
const SOUND_SETTINGS_KEY 		= "sound_settings_title"
const MASTER_SETTINGS_KEY 		= "master_sound_settings"
const BGM_SETTINGS_KEY			= "bgm_settings"
const SFX_SETTINGS_KEY 			= "sfx_settings"
const UI_SOUNDS_SETTINGS_KEY	= "ui_sounds_settings"
const UI_CANCEL					= "ui_cancel"
const UI_CONFIRM				= "ui_confirm"
const RESUME_KEY				= "resume"
const SETTINGS_KEY				= "settings"
const QUIT_KEY					= "quit"
