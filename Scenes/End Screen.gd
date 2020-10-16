extends Control


func _input(event):
	if event.is_action("primary_fire"):
		get_tree().change_scene_to("res://Scenes/Game.tscn")


func _on_End_Screen_tree_entered():
	pass # Replace with function body.
