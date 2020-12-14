extends "res://src/Levels/LevelBase.gd"

var level2 = "res://src/Levels/Level2.tscn"

func _on_Area2D_body_entered(body):
	if body is Player:
		_next_level(level2)
