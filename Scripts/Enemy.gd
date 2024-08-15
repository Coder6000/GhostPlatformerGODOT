class_name enemy
extends Node2D

@onready var raycastRight = $RayCastRight 
@onready var rayCastLeft = $RayCastLeft
@onready var animatedSprite = $AnimatedSprite2D

var speed = 40
var direction = 1

func _process(delta):
	if raycastRight.is_colliding():
		direction = -1
		animatedSprite.flip_h = true
	if rayCastLeft.is_colliding():
		direction = 1
		animatedSprite.flip_h = false

	position.x += direction * speed * delta
