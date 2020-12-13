extends Node

const JUMP_BOOST = 'jump'
const STRENGTH_BOOST = 'strength'
const SPEED_BOOST = 'speed'

const JUMP_THRESHOLD = 0.9

var speed_animation = preload("res://assets/graphics/Level/Items/Anim_bst_speed.tres")
var strength_animation = preload("res://assets/graphics/Level/Items/Anim_bst_strength.tres")
var jump_animation = preload("res://assets/graphics/Level/Items/Anim_bst_jump.tres")

##### LOCALIZATION #####
const ENEMY_TITLE_KEY = "enemy_tutorial_title"
const ENEMY_DESC_KEY = "enemy_tutorial_desc"
