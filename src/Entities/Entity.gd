class_name Entity
extends KinematicBody2D

const FLOOR_NORMAL = Vector2.UP

export var speed = Vector2(200, 400)
onready var gravity = ProjectSettings.get("physics/2d/default_gravity")
var _velocity = Vector2.ZERO

func _physics_process(delta):
	_velocity.y += gravity * delta
