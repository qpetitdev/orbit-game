extends CanvasLayer

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		ScreenManager.change_screen(Constants.ScreenState.GAME_SCREEN)
