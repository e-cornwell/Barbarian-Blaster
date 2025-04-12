extends Node

@export var spawn_time_curve: Curve
@export var game_length := 30.0
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(game_length)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(get_spawn_time())

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / game_length)

func get_spawn_time() -> float:
	return spawn_time_curve.sample(game_progress_ratio())
