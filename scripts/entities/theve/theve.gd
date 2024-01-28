extends CharacterBody2D


const GRAVITY = 200
const SPEED = 100
var nr_speed_multiplier := 1

var direction := Vector2.ZERO
var can_jump := true

@onready var n_tilemap = get_tree().current_scene.find_child("TileMap")
var tiledata_1
var b_on_wall := false
var b_on_ground := false

func _process(delta):
	tilemap_data()
	player_movement(delta)

func player_movement(delta):
	direction.x = Input.get_axis("move_left","move_right")
	direction.y = Input.get_axis("move_up","move_down")
	
	if b_on_wall and can_jump:
		velocity.x = direction.x
		velocity.y = GRAVITY
		velocity.x *= SPEED * nr_speed_multiplier
#		$hitbox.disabled = true
	elif direction:
		velocity = Vector2(direction.x, direction.y).normalized()
		velocity *= SPEED * nr_speed_multiplier
#		$hitbox.disabled = false
	else:
		velocity = Vector2(0, 0)
#		$hitbox.disabled = false
		
	
	move_and_slide()

func tilemap_data():
	tiledata_1 = n_tilemap.get_cell_tile_data(1, n_tilemap.local_to_map(position))
	if tiledata_1:
		if tiledata_1.get_custom_data("height") == 1:
			b_on_wall = true
			b_on_ground = false
		elif tiledata_1.get_custom_data("height") == 2:
			b_on_wall = false
			b_on_ground = true
