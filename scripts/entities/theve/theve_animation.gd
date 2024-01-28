extends Node2D


func _input(event):
	if Input.is_action_just_pressed("jump") and owner.can_jump and owner.b_on_ground:
		print(1)
		$AnimationTree["parameters/conditions/jump"] = true
		owner.nr_speed_multiplier = 1.5
		owner.can_jump = false

func anim_jump_end():
	print(2)	
	$AnimationTree["parameters/conditions/jump"] = false
	owner.nr_speed_multiplier = 1
	owner.can_jump = true
