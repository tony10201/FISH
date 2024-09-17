extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var movingLeft = true
var health:int = 10

func _physics_process(_delta: float) -> void:
	inputs()
	moveKnife()
	#animation stoof idk flip if moving at a certain way
	if velocity.x >= .5:
		$Sprite2D.flip_h = true
		movingLeft = false
	if velocity.x <= -0.5:
		$Sprite2D.flip_h = false
		movingLeft = true

	move_and_slide()

#moves knife left and right with a delay between moving lol might change to a tween or something smoother :P
#ok changed move_toward to lerp does the thingy i was looking 4 :3 - lunar
func moveKnife():
	if not movingLeft:
		$Knife.global_rotation = global_rotation + 45
		$Knife.global_position.x = lerp($Knife.global_position.x, global_position.x + 45, .2)
	else:
		$Knife.global_rotation = global_rotation
		$Knife.global_position.x = lerp($Knife.global_position.x, global_position.x - 45, .2)

func inputs():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var Hdirection := Input.get_axis("Left", "Right")
	var Vdirection := Input.get_axis("Up", "Down")
	#left and right movement :/
	if Hdirection:
		velocity.x = Hdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#up and down movement :3
	if Vdirection:
		velocity.y = Vdirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
