extends Node2D

@onready var galaxy: Sprite2D = $Galaxy
@onready var galaxy_hurt: Sprite2D = $GalaxyHurt
@onready var galaxy_broke: Sprite2D = $GalaxyBroke
@onready var flash_rect: ColorRect = $CanvasLayer/FlashRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_loose_life.connect(_on_loose_life)
	hide_all_galaxies()
	galaxy.visible = true


func _on_loose_life(remaining_lives: int) -> void:
	hide_all_galaxies()
	flash()
	match remaining_lives:
		3:
			galaxy.visible = true
		2:
			galaxy_hurt.visible = true
		1:
			galaxy_broke.visible = true

func hide_all_galaxies():
	galaxy.visible = false
	galaxy_hurt.visible = false
	galaxy_broke.visible = false
	
func flash():
	flash_rect.color.a = 0
	var tween = create_tween()
	tween.tween_property(flash_rect, "color:a", 0.4, 0.1)
	tween.tween_property(flash_rect, "color:a", 0, 0.2)
