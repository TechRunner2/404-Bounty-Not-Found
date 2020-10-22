extends RigidBody2D

var been_scanned = false

func _on_ScanArea_body_entered(body):
	if body != self:
		if body.is_in_group("Asteroid"):
			body.take_damage(10000)
		if body.is_in_group("Player"):
			if not been_scanned:
				body.can_scan = true
				print("Can Scan")
		pass # Replace with function body.

func _on_ScanArea_body_exited(body):
	if body.is_in_group("Player"):
		body.can_scan = false
		print("Can't Scan")
	pass # Replace with function body.
