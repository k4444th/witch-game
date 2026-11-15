extends Node

var preferencesSavePath = "user://preferences.json"

var preferences := {
	"showGridCursor": 0
}

func _ready() -> void:
	loadData()
	resetData()
	saveData()

func saveData():
	var newPreferences = {
		"showGridCursor": preferences
	}
	
	var file = FileAccess.open(preferencesSavePath, FileAccess.WRITE)
	file.store_string(JSON.stringify(newPreferences))
	file.close()

func loadData():
	if FileAccess.file_exists(preferencesSavePath):
		var file = FileAccess.open(preferencesSavePath, FileAccess.READ)
		var content = file.get_as_text()
		file.close()

		var loadedPreferences = JSON.parse_string(content)
		
		if typeof(loadedPreferences) == TYPE_DICTIONARY:
			preferences = loadedPreferences.get("showGridCursor", {
					"showGridCursor": 0
				}
			)

func resetData():
	preferences["showGridCursor"] = true
