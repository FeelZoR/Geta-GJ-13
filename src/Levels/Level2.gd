extends "res://src/Levels/LevelBase.gd"

func _on_Teleporter_body_entered(body):
	if body is Player:
		$Player.global_position = $Events/Teleporter/Position2D.global_position

func _on_NextLevel_body_entered(body):
	if body is Player:
		get_tree().change_scene("res://src/UI/Win.tscn")
