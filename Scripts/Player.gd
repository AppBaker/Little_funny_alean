extends KinematicBody2D

var linear_velocity = Vector2(0, 0)
const SPEED = 400
const GRAVITY = 30
const UP = Vector2(0, -1)
const JUMP_SPEED = 1500
const LEVEL_LIMIT = 3000 


var boost_multiplier = 1.5
onready var sprite = $Sprite

func _physics_process(delta):
	animate()
	apply_gravity()
	move()
	jump()
	move_and_slide(linear_velocity, UP)
	

func apply_gravity():
	if position.y > LEVEL_LIMIT:
		get_tree().call_group("Rules", "end_geme" )
	if  is_on_floor() and linear_velocity.y > 0:
		linear_velocity.y = 0 
	elif is_on_ceiling():
		linear_velocity.y = 1
	else:
		linear_velocity.y +=GRAVITY

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		linear_velocity.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		linear_velocity.x = SPEED
	else:
		linear_velocity.x = 0


func jump():
	apply_gravity()
	if Input.is_action_pressed("jump") and is_on_floor():
		linear_velocity.y = -JUMP_SPEED
		$JumpSound.play()


func animate():
	if linear_velocity.y < 0:
		sprite.play("jump")
	elif linear_velocity.x > 0:# идем в право
		sprite.play("walk")
		sprite.flip_h = false
	elif linear_velocity.x < 0:# идем в лево
		sprite.play("walk")
		sprite.flip_h = true 
	else:
		sprite.play("idle")


func hurt():
	position.y -= 1 
	yield(get_tree(), "idle_frame")
	print("Player HURT")

	linear_velocity.y = -JUMP_SPEED * 0.55

	$PainSounnd.play()


func boost():
	linear_velocity.y = -JUMP_SPEED * boost_multiplier
