extends Node2D
@onready var animation_player = $Knife/AnimationPlayer
@onready var Player = find_parent("Player")
var damage: int = 1
var speed: float = 1.0

#its the update function watcha expect _delta cause im not using it :3.
func _process(_delta: float) -> void:
	animationStuff()
	
#animation changes depending on direction
func animationStuff():
	if not animation_player.is_playing():
		animation_player.stop()
	if Input.is_action_just_pressed("LeftClick") and Player.movingLeft == true:
		animation_player.play("SwingLeft")
	if Input.is_action_pressed("LeftClick") and Player.movingLeft == false:
		animation_player.play("SwingRight")
#Checks parent group and deletes if true.
func detectHit(body:StaticBody2D) -> void:
	if body.is_in_group("Enemy"):
		print("Enemy died!")
		body.get_parent().queue_free()
