extends Node2D
@onready var animation_player = $Knife/AnimationPlayer
@onready var Player = find_parent("Player")
var damage: int = 1
var speed: float = 1.0

func _process(_delta: float) -> void:
	animationStuff()
	

func animationStuff():
	if not animation_player.is_playing():
		animation_player.stop()
	if Input.is_action_just_pressed("LeftClick") and Player.movingLeft == true:
		animation_player.play("SwingLeft")
	if Input.is_action_pressed("LeftClick") and Player.movingLeft == false:
		animation_player.play("SwingRight")

func detectHit(body) -> void:
	if body.is_in_group("Enemy"):
		print("Enemy died!")
		body.queue_free()
