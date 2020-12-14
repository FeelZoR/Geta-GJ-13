extends "res://src/Levels/LevelBase.gd"

var level3 = "res://src/Levels/Level3.tscn"

func _on_Teleporter_body_entered(body):
	if body is Player:
		$Player.global_position = $Events/Teleporter/Position2D.global_position

func _on_NextLevel_body_entered(body):
	if body is Player:
		_next_level(level3)
