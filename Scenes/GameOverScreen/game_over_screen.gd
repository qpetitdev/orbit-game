extends CanvasLayer

@onready var score_label: Label = $Control/MarginContainer/VBoxContainer/VBoxContainer/ScoreLabel
@onready var timer: Timer = $Timer

func _ready() -> void:
	score_label.text = str(GameManager.last_score)
	SoundManager.play_game_over()
	timer.start()

func _on_timer_timeout() -> void:
	ScreenManager.change_screen(Constants.ScreenState.TITLE_SCREEN)
