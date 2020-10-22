extends Control

onready var player = get_node("../../Player")

func _ready():
	$"Health Bar".max_value = player.max_health

func _process(delta):
	$"Health Bar".value = player.health
