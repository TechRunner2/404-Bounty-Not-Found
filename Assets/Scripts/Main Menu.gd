extends Control

func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.

func _on_About_pressed():
	get_tree().change_scene("res://Scenes/About.tscn")
	pass # Replace with function body.


func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	pass # Replace with function body.
