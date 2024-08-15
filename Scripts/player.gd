class_name player
extends CharacterBody2D

@export var speed = 1000.0
@export var jumping_speed = 100.0

var timerCounter = 0
var heartsCounter = 3

@onready var animatedSprite = $AnimatedSprite2D
@onready var timerLabel = $TimerCounter
@onready var heartsLabel = $HeartsCounter
@onready var knockbackTimer = $knockBackTimer


var canMove = true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	manageTimer()
	manageHearts()

func _physics_process(delta):
	Movement(delta)
	move_and_slide()
	velocity.is_normalized()


func Movement(delta):
	var inputDirection = Input.get_axis("move_left", "move_right")

	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jumping_speed
			
	if inputDirection:
		velocity.x = inputDirection * speed * delta
		if inputDirection < 0:
			animatedSprite.flip_h = true
		else:
			animatedSprite.flip_h = false
	else:
		velocity.x = 0
	
func manageTimer():
	timerLabel.text = "Timer: " + str(timerCounter)

func manageHearts():
	heartsLabel.text = "Hearts: " + str(heartsCounter)
	if heartsCounter >= 3:
		heartsCounter = 3
	if heartsCounter <= 0:
		heartsCounter = 0

func _on_timer_timeout():
	timerCounter += 1
