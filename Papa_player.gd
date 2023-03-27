extends KinematicBody2D

var linear_velocity = Vector2(0, 0)
const SPEED = 400
const GRAVITY = 100
const UP = Vector2(0, -1)
const JUMP_SPEED = 1400

onready var animatedSprite = $AnimatedSprite

func _physics_process(delta):
	apply_gravity()
	#linear_velocity.y-=JUMP_SPEED
	if Input.is_action_just_pressed("jump") and is_on_floor():
		linear_velocity.y-=JUMP_SPEED
		animate()
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		linear_velocity.x = -SPEED
		animate()
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		linear_velocity.x = SPEED
		animate()
	else:
		linear_velocity.x = 0
		animatedSprite.play("idle")
	move_and_slide(linear_velocity, UP)
	
	
func apply_gravity():
	if not is_on_floor():
		linear_velocity.y +=GRAVITY  
	else:
		linear_velocity.y = 0

func animate():
	animatedSprite.play("walk")
