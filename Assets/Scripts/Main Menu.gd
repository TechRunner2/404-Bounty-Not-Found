extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var window = get_viewport_rect()
	#$Stars.generate_stars(window.position.x + window.size.x/2, window.position.y + window.size.y / 2, window.size.x, window.size.y)
	#$Asteroids.generate(window.position.x + window.size.x/2, window.position.y + window.size.y / 2, window.size.x, window.size.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_About_pressed():
	get_tree().change_scene("res://Scenes/About.tscn")
	pass # Replace with function body.


func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	pass # Replace with function body.
