extends Node2D

var menu = preload("res://Assets/Scripts/Main Menu.gd")
var game = preload("res://Assets/Scripts/Game.gd")
var end = preload("res://Scenes/End Screen.tscn")
export var level = 0

func _ready():
	$Music.play()
	add_child(menu)

func _process(delta):
	
	pass

func change_level(level):
	var child = get_child(0)
	match level:
		0:
			
			pass
