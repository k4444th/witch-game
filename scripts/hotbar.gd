extends Node2D

# Nodes (onready)
@onready var keys := [
	$HotbarKey1,
	$HotbarKey2,
	$HotbarKey3,
	$HotbarKey4,
	$HotbarKey5,
	$HotbarKey6,
	$HotbarKey7,
	$HotbarKey8,
	$HotbarKey9,
	$HotbarKey10,
]

# Signals
signal hotbarKeyPressed(id: int)

func _ready() -> void:
	for key in keys:
		key.connect("hotbarKeyPressed", handleHotbarKeyPressed)

func setSelectedKey(id: int):
	for key in keys:
		key.release_focus()
	
	keys[id].grab_focus()
	keys[id].move_to_front()

func handleHotbarKeyPressed(id: int):
	hotbarKeyPressed.emit(id)
