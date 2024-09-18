extends Node2D
@onready var animation_player = $Knife/AnimationPlayer
@onready var Player = find_parent("Player")
var damage: int = 1
var attackSpeed: float = 1.0
var enemies:Array = []


#its the update function watcha expect _delta cause im not using it :3.
func _process(_delta: float) -> void:
	animationStuff()
	attack()
	
#animation changes depending on direction
func animationStuff():
	if not animation_player.is_playing():
		animation_player.stop()
	if Input.is_action_just_pressed("LeftClick") and Player.movingLeft == true:
		animation_player.play("SwingLeft")
	if Input.is_action_pressed("LeftClick") and Player.movingLeft == false:
		animation_player.play("SwingRight")

func attack():
	if Input.is_action_just_pressed("LeftClick"):
		if enemies.size() > 0:
			var enemy
			for element in enemies:
				enemy = element
				if enemy.dying == false:
					enemy.die()

#Adds enemy body into group only enemys should be allowed
#so no way a random node gets in right? -Lunar
func detectHit(area) -> void:
	if area.is_in_group("Enemy"):
		enemies.append(area.get_parent())
#Checks if the body has left removes from array maybe could be better lol -Lunar
func detectExit(area) -> void:
	enemies.erase(area.get_parent())
