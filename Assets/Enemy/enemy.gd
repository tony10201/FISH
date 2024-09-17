extends Node2D
@onready var player: CharacterBody2D = get_node("/root/Main/Player")

var speed = 100 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Spawn on border 
	move_towards_player(delta)
	
	pass

func _on_body_entered(body):
	if body.name == "Knife":
		queue_free()

#Silly Movement AI thats it
func move_towards_player(delta):
	if player.position == null:
		push_error("XD")
	if global_position == null:
		push_error("XD2")
	var direction = (player.global_position - global_position).normalized()
	var movement = direction * speed * delta
	translate(movement)
