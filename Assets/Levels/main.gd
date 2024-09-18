extends Node2D
@onready var EnemyPre = preload("res://Assets/Enemy/enemy.tscn")
@onready var enemySpawner = $EnemyPath/EnemySpawner
@onready var player = $Player
@onready var spawnTimer = $EnemyPath/SpawnTimer
@onready var healthLabel:Label = $UI/HealthLabel

@onready var killLabel:Label = $UI/EnemiesKilled
var enemiesKilled: int = 0

func _ready() -> void:
	spawnTimer.start()

func _process(_delta: float) -> void:
	enemySpawner.progress_ratio = enemySpawner.progress_ratio + 0.01
	killLabel.text = "Enemies Killed: " + str(enemiesKilled)
	if player != null:
		healthLabel.text = "Health: " + str(player.health)
	else:
		healthLabel.text = "dead"
	if player == null:
		spawnTimer.stop()

func scoreUp():
	enemiesKilled = enemiesKilled + 1

#spawns enemies every .5 seconds could add a limit but i like seeing 10000 fishes all pusing on the player
func _on_spawn_timer_timeout() -> void:
	var enemy = EnemyPre.instantiate()
	add_child(enemy)
	enemy.global_position = enemySpawner.global_position
