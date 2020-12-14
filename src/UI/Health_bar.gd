extends HBoxContainer

var heart = preload("res://assets/graphics/HUD/heart.png")
var heart_list = []
var _player

func setup_bar(player):
	_player = player
	remove_all_hearts()
	for _i in range(0, player.health):
		add_heart()

func add_heart():
	var heart_node = TextureRect.new()
	heart_node.texture = heart
	add_child(heart_node)
	heart_list.append(heart_node)

func remove_heart():
	heart_list[heart_list.size() - 1].queue_free()
	heart_list.remove(heart_list.size() - 1)

func remove_all_hearts():
	for heart_node in heart_list:
		heart_node.queue_free()
	heart_list.clear()
