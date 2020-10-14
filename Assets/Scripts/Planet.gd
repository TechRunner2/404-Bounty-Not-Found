extends RigidBody2D


var been_scanned = false

# Called when the node enters the scene tree for the first time.
func _ready():

	pass # Replace with function body.

func _process(delta):
	#if $ScanArea.is_colliding():
	#	print("Collision!")
	pass

func _physics_process(delta):
	pass


func _on_ScanArea_body_entered(body):
	#if body.has_variable("can_scan") and not been_scanned:
	#	body.can_scan = true
	pass # Replace with function body.
