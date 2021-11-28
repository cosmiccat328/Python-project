extends KinematicBody2D

var speed = 300
var movement = Vector2()
var gravity = 30
var UP = Vector2.UP

func _ready():
	movement.x= -speed


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	move()

func move():
	movement.y += gravity
	if is_on_wall():
		movement.x *= -1
	movement.y = move_and_slide(movement, UP).y

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bnlonk_body_entered(body):
	if body.global_position.y > get_node("bnlonk").global_position.y:
		return
	queue_free()
