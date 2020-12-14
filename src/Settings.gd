extends Node

const JUMP_BOOST = 'jump'
const STRENGTH_BOOST = 'strength'
const SPEED_BOOST = 'speed'

const JUMP_THRESHOLD = 0.9

var speed_animation = preload("res://assets/graphics/Level/Items/Anim_bst_speed.tres")
var strength_animation = preload("res://assets/graphics/Level/Items/Anim_bst_strength.tres")
var jump_animation = preload("res://assets/graphics/Level/Items/Anim_bst_jump.tres")

const EASY_DIFF = 'easy'
const MEDIUM_DIFF = 'medium'
const HARD_DIFF = 'hard'
var difficulty = EASY_DIFF

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
const RESUME_KEY				= "resume"
const SETTINGS_KEY				= "settings"
const QUIT_KEY					= "quit"
const BEGIN_TITLE_KEY			= "begin_tutorial_title"
const BEGIN_DESC_KEY			= "begin_tutorial_desc"
const PLATFORM_TITLE_KEY		= "platform_tutorial_title"
const PLATFORM_DESC_KEY			= "platform_tutorial_desc"
const BOOST_TITLE_KEY			= "boost_tutorial_title"
const BOOST_DESC_KEY			= "boost_tutorial_desc"
const JUMP_TITLE_KEY			= "jump_boost_title"
const JUMP_DESC_KEY				= "jump_boost_desc"
const SPEED_TITLE_KEY			= "speed_boost_title"
const SPEED_DESC_KEY			= "speed_boost_desc"
const STRENGTH_TITLE_KEY		= "strength_boost_title"
const STRENGTH_DESC_KEY			= "strength_boost_desc"

##### LAYERS #####
const MOVEMENT_LAYER = 1
const PLAYER_LAYER = 2
const ENEMY_LAYER = 4
const FRIENDLY_PROJECTILE_LAYER = 8
const ENEMY_PROJECTILE_LAYER = 16
