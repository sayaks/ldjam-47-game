extends KinematicBody2D


var velocity: Vector2 = Vector2(0,0)
var gravity: float = 18 * 9.81
var movement_speed = 18 * 5
var jump_speed: float = gravity * 0.75

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var i = 0
func _process(delta):
	
	if (Input.is_action_pressed("move_right") and velocity.x < movement_speed):
		velocity.x += min(movement_speed - velocity.x, movement_speed)
	if (Input.is_action_pressed("move_left") and velocity.x > -movement_speed):
		velocity.x -= min(movement_speed + velocity.x, movement_speed)
	if (Input.is_action_just_pressed("jump")):
		velocity.y = -jump_speed
		
	velocity.y += gravity * delta

	move_and_slide(velocity, Vector2(0,-1))

	if is_on_floor() and velocity.y >= 0:
		velocity = Vector2(0,0)
