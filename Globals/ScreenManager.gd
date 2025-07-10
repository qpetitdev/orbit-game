extends Node

var scenes = {
	Constants.ScreenState.TITLE_SCREEN : preload("res://Scenes/TitleScreen/title_screen.tscn"),
	Constants.ScreenState.GAME_SCREEN : preload("res://Scenes/Main/main.tscn"),
	Constants.ScreenState.GAME_OVER_SCREEN : preload("res://Scenes/GameOverScreen/game_over_screen.tscn"),
}

func change_screen(state: Constants.ScreenState):
	get_tree().change_scene_to_packed(scenes[state])
