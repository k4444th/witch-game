extends Node

func _ready() -> void:
	ResourceLoader.load_threaded_request(Gamemanager.nextScene)

func _process(_delta: float) -> void:
	var progress = []
	ResourceLoader.load_threaded_get_status(Gamemanager.nextScene, progress)
	%ProgressBar.value = progress[0] * 100
	
	if progress[0] == 1:
		var packedScene = ResourceLoader.load_threaded_get(Gamemanager.nextScene)
		get_tree().change_scene_to_packed(packedScene)
