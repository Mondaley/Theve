extends CharacterBody2D

const SPEED = 100
var nr_speed_multiplier := 1

var direction := Vector2.ZERO
var can_jump := true

func _process(delta):	
	player_movement(delta)

func player_movement(delta):
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	
	if direction:
		velocity = Vector2(direction.x, direction.y).normalized()
		velocity *= SPEED * nr_speed_multiplier
	else:
		velocity = Vector2(0,0)
	
	move_and_slide()

