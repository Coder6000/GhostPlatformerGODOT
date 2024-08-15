extends Area2D

@onready var deathTimer = $DeathTimer

var playerBody: player

func _on_body_entered(body:Node2D):
	playerBody = body
	playerBody.heartsCounter -= 1
	
	if body.heartsCounter == 0:
		playerBody.get_node("CollisionShape2D").queue_free()
		playerBody.velocity.y = -400
		deathTimer.start()

func _on_death_timer_timeout():
	get_tree().reload_current_scene()
