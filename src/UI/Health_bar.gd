extends HBoxContainer

var heart = preload("res://assets/graphics/HUD/heart.png")
var heart_list = []

func setup_bar(nb_hearts):
	for i in range(0, nb_hearts):
		var heart_node = TextureRect.new()
		heart_node.texture = heart
		add_child(heart_node)
		heart_list.append(heart_node)

func remove_heart():
	heart_list[heart_list.size() - 1].queue_free()
	heart_list.remove(heart_list.size() - 1)
