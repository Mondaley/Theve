extends Node2D

@onready var animationTree = $AnimationTree

var store_direction := Vector2.ZERO

func _ready():
	store_direction.y = 1

func _physics_process(_delta):
	if Input.is_action_pressed("move_right"):
		store_direction.x = 1
	if Input.is_action_pressed("move_left"):
		store_direction.x = -1
	if Input.is_action_pressed("move_up"):
		store_direction.y = -1
	if Input.is_action_pressed("move_down"):
		store_direction.y = 1
	
	_walk()
	jump()

func _walk():
	if owner.direction and !owner.is_jumping:
		animationTree["parameters/conditions/walk"] = true
		animationTree["parameters/conditions/idle"] = false
		animationTree["parameters/walk/blend_position"] = store_direction
	elif !owner.direction and !owner.is_jumping:
		animationTree["parameters/conditions/walk"] = false
		animationTree["parameters/conditions/idle"] = true
		animationTree["parameters/idle/blend_position"] = store_direction

func jump():
	if Input.is_action_just_pressed("jump") and owner.is_jumping == false and owner.b_on_ground:
		owner.is_jumping = true
	elif owner.is_jumping:
		animationTree["parameters/conditions/walk"] = false
		animationTree["parameters/conditions/idle"] = false
		animationTree["parameters/conditions/jump"] = true
		animationTree["parameters/jump/blend_position"] = store_direction
		animationTree["parameters/fall/blend_position"] = store_direction
		owner.collision_mask = 16
		owner.nr_speed_multiplier = 1.5

func anim_jump_end():
	animationTree["parameters/conditions/walk"] = false
	animationTree["parameters/conditions/idle"] = true
	animationTree["parameters/conditions/jump"] = false
	owner.collision_mask = 17
	owner.nr_speed_multiplier = 1
	owner.is_jumping = false
