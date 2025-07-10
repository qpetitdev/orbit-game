extends Node

const HIT = preload("res://Assets/sounds/hit.wav")
const REBOUND = preload("res://Assets/sounds/rebound.wav")
const GAME_OVER = preload("res://Assets/sounds/game_over.wav")

var player: AudioStreamPlayer

func _ready():
	player = AudioStreamPlayer.new()
	add_child(player)

func play_sound(stream: AudioStream, volume_db: float = 0.0):
	player.stream = stream
	player.volume_db = volume_db
	player.play()

func play_hit():
	play_sound(HIT, -3.0)

func play_rebound():
	play_sound(REBOUND, -12.0)

func play_game_over():
	play_sound(GAME_OVER, -17.0)
