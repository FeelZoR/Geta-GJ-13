extends Node

signal level_start(player)
signal level_change(level)

onready var _player = $Player

func _ready():
	emit_signal("level_start", _player)

func _next_level(level):
	emit_signal("level_change", level)
