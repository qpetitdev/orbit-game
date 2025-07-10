extends Node

signal on_scored()
signal on_hit_border()
signal on_game_over()
signal on_score_changed(score: int)
signal on_loose_life(remaining_lives: int)

func emit_on_hit_border() -> void:
	on_hit_border.emit()

func emit_on_scored() -> void:
	on_scored.emit()

func emit_on_game_over() -> void:
	on_game_over.emit()

func emit_on_score_changed(score: int) -> void:
	on_score_changed.emit(score)
	
func emit_on_loose_life(remaining_lives: int) -> void:
	on_loose_life.emit(remaining_lives)
