extends Area2D

func _on_body_entered(body:Node2D):
	body.heartsCounter += 1
	queue_free()
