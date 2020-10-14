extends Node

var states = []
var current_state = null 
var previous_state = null

func create_state(new_state):
	if not new_state in states:
		states.append(new_state)
	else:
		print("Trying to add state that already exists")
	pass

func remove_state(state):
	if state in states:
		var state_location = states.bsearch(state)
		states.remove(state_location)
	else:
		print("Trying to remove state that does not exist")
	pass

func set_state(new_state):
	if new_state in states:
		previous_state = current_state
		current_state = new_state
	else:
		print("Trying to set state to non state")
	pass

func get_state():
	return current_state


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
