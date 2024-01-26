extends CharacterBody2D

const SPEED = 10

var direction := Vector2.ZERO

#var can_attack := true
#var damage := 25
#var is_chat = true

#func _ready():
#	match get_tree().current_scene.name:
#		"Home":
#			position = Global.previous_world_positions["Home"]
#		"Village":
#			position = Global.previous_world_positions["Village"]
#		"Wild":
#			position = Global.previous_world_positions["Wild"]
#		_:
#			position = Vector2.ZERO

func _process(delta):	
	player_movement(delta)

func player_movement(delta):
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	
	if direction:
		velocity = Vector2(direction.x, direction.y).normalized()
		velocity *= SPEED 
	else:
		velocity = Vector2(0,0)
	
	move_and_slide()

