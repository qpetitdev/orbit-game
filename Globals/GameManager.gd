extends Node

var lives: int = 3
var score: int = 0
var last_score: int = 0

func _ready() -> void:
	SignalManager.on_hit_border.connect(_on_hit_border)
	SignalManager.on_scored.connect(_on_scored)

func _on_hit_border():
	lose_life()
	
func _on_scored():
	increase_score()

func lose_life():
	lives -= 1
	SignalManager.emit_on_loose_life(lives)
	if lives <= 0:
		game_over()
	else:
		SoundManager.play_hit()

func game_over():
	ScreenManager.change_screen(Constants.ScreenState.GAME_OVER_SCREEN)
	SignalManager.emit_on_game_over()
	SoundManager.play_game_over()
	last_score = score
	reset()

func increase_score(amount: int = 1):
	score += amount
	SignalManager.emit_on_score_changed(score)
	
func reset():
	score = 0
	lives = 3
