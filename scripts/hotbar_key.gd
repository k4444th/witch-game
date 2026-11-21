extends TextureButton

# Export variables
@export var id: int

# Signals
signal hotbarKeyPressed(id: int)

func _on_pressed() -> void:
	grab_focus()
	move_to_front()
	hotbarKeyPressed.emit(id)

func _on_button_down() -> void:
	move_to_front()
