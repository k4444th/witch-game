extends CanvasLayer

# Definitions

# Nodes (onready)
@onready var hotbarNode := $HBox/Hotbar

func _ready():
	hotbarNode.scale = Vector2(Globals.preferences.hudScale, Globals.preferences.hudScale)
