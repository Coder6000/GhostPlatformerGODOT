extends Area2D


@onready var timer = $Timer

var playerBody: player

func _on_body_entered(body:Node2D):
	playerBody = body
	playerBody.get_node("CollisionShape2D").queue_free()
	playerBody.velocity.y = -400
	timer.start()
	
func _on_timer_timeout():
	get_tree().reload_current_scene()



