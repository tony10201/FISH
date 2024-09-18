extends Node2D
@onready var player:CharacterBody2D = get_node("/root/Main/Player")
@onready var dying:bool = false
@onready var streamer = $Streamer
@onready var Main = get_node("/root/Main")
var speed = 100 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#Spawn on border 
	if not dying and player != null:
		move_towards_player(delta)
#kills enemy and play foony sound
func die():
	dying = true
	Main.scoreUp()
	streamer.play()
	rotation = 90
#deletes when sound is over
func streamerEnded():
	queue_free()

#Silly Movement AI thats it
func move_towards_player(delta):
	if player.position == null:
		push_error("XD")
	var direction = (player.global_position - global_position).normalized()
	var movement = direction * speed * delta
	look_at(player.position)
	translate(movement)
func on_body_entered(body):
	if body.is_in_group("Player") and body.invincible == false and dying == false:
		body.hurt()
