extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var movingLeft = true

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var Hdirection := Input.get_axis("Left", "Right")
	if Hdirection:
		velocity.x = Hdirection * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x >= .5:
		$Sprite2D.flip_h = true
		movingLeft = false
		$Knife.global_position.x = global_position.x + 45
		$Knife.global_rotation = global_rotation + 45
	if velocity.x <= -0.5:
		$Sprite2D.flip_h = false
		movingLeft = true
		$Knife.global_position.x = global_position.x - 45
		$Knife.global_rotation = global_rotation
	var Vdirection := Input.get_axis("Up", "Down")
	if Vdirection:
		velocity.y = Vdirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	
