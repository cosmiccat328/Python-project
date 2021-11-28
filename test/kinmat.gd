extends KinematicBody2D

var speed = 300
var jump = -600
var velocity = Vector2()
var gravity = 20
var UP = Vector2(0, -1)



func _physics_process(delta):
	velocity.y = velocity.y + gravity
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = jump
	velocity = move_and_slide(velocity, UP)
	
	


func _on_Area2D_body_entered(body):
	queue_free()
	get_tree().change_scene("res://failiure.tscn")
