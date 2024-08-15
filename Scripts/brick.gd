extends RigidBody2D

var brickDestroyCounter = 0

func _on_area_2d_body_entered(body):
	if not body.is_on_floor():
		brickDestroyCounter += 1
	if brickDestroyCounter == 3:
		get_node(".").queue_free()
	
	print(brickDestroyCounter)
