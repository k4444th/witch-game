extends Node

var savePath = "user://data.json"

var gameData := {
	"level": 0
}

func _ready() -> void:
	loadData()
	#resetData()
	#saveData()

func saveData():
	var data = {
		"data": gameData
	}
	
	var file = FileAccess.open(savePath, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()

func loadData():
	if FileAccess.file_exists(savePath):
		var file = FileAccess.open(savePath, FileAccess.READ)
		var content = file.get_as_text()
		file.close()

		var loadedData = JSON.parse_string(content)
		
		if typeof(loadedData) == TYPE_DICTIONARY:
			gameData = loadedData.get("data", {
					"level": 0
				}
			)

func resetData():
	gameData["level"] = 0
