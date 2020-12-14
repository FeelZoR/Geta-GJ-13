extends "res://src/Levels/LevelBase.gd"

const BLOCK_TO_REMOVE = Vector2(40, 1)
const NB_BLOCKS = 3

var enemies_remaining = 3	# The number of enemies to kill to open the door

onready var _tilemap = $Map/TileMap

func _remove_blocks():
	for i in range(0, NB_BLOCKS):
		_tilemap.set_cell(BLOCK_TO_REMOVE.x, BLOCK_TO_REMOVE.y+i, -1)
	_tilemap.set_cell(BLOCK_TO_REMOVE.x, BLOCK_TO_REMOVE.y + NB_BLOCKS, Settings.GROUND_ID)

func _on_Enemy_death():
	enemies_remaining -= 1
	if enemies_remaining <= 0:
		_remove_blocks()

func _on_EndGame_body_entered(body):
	if body is Player:
		get_tree().change_scene("res://src/UI/Win.tscn")
