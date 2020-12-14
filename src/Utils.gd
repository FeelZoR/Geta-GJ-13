extends Node

func calculate_launch_angle(source_pos, dest_pos, v, g, optimized=true):
	var pos = dest_pos - source_pos
	
	var root1 = atan2(pow(v, 2) + sqrt(pow(v, 4) - g * (g*pow(pos.x, 2) + 2 * -pos.y * pow(v, 2))), g * pos.x)
	var root2 = atan2(pow(v, 2) - sqrt(pow(v, 4) - g * (g*pow(pos.x, 2) + 2 * -pos.y * pow(v, 2))), g * pos.x)
	
	if is_nan(root1):
		if is_nan(root2):
			return null
		else:
			return root2
	elif is_nan(root2):
		return root1
		
	var dist1 = abs( abs(root1) - PI/2 ) # We see the distance from PI/2 (90°)
	var dist2 = abs( abs(root2) - PI/2 ) # to choose the best trajectory
			
	if optimized:
		# The higher the distance, the better the trajectory
		return root1 if dist1 > dist2 else root2
	else:
		return root2 if dist1 > dist2 else root1
