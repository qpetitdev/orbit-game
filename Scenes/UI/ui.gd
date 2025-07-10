extends Control

@onready var label_lives_value: Label = $MarginContainer/VBoxContainer/HBoxContainer3/HBoxContainer/LabelLivesValue
@onready var label_score_value: Label = $MarginContainer/VBoxContainer/HBoxContainer3/HBoxContainer2/LabelScoreValue

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_score_changed.connect(_on_score_changed)
	SignalManager.on_loose_life.connect(_on_loose_life)

func _on_score_changed(score: int):
	label_score_value.text = str(score)
	
func _on_loose_life(remaining_lives: int):
	label_lives_value.text = str(remaining_lives)
