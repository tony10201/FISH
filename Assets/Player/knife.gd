extends Area2D

var damage: int = 1
var speed: float = 1.0

func detectHit(body) -> void:
	if body.is_in_group("Enemy"):
		pass
