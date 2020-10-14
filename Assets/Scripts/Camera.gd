extends Camera2D

export var buffer_radius = 50
export var lerp_scale = 0.05

func NewPos(player):
	var new_x = lerp(position.x, player.x, lerp_scale)
	var new_y = lerp(position.y, player.y, lerp_scale)
	position = Vector2(new_x, new_y)

func _on_Player_pos_update(pos):
	NewPos(pos)
	pass # Replace with function body.
