extends Camera2D

# map drag logic
var dragging := false
var lastMousePos := Vector2.ZERO

# map zoom logic
var zoomStep := 0.05
var minZoom := 0.25
var maxZoom := 3.0

func _input(event: InputEvent) -> void:
	print(event)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed
			
			if dragging:
				lastMousePos = get_viewport().get_mouse_position()
		
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoomAtMouse (1 - zoomStep)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoomAtMouse (1 + zoomStep)
	
	if event is InputEventPanGesture:
		zoomAtMouse(1 + zoomStep if event.delta.y > 0 else 1 - zoomStep)
	
	elif event is InputEventMouseMotion and dragging:
		var currentMousePos = get_viewport().get_mouse_position()
		var delta = currentMousePos - lastMousePos

		position -= delta / zoom.x
		lastMousePos = currentMousePos

func zoomAtMouse(factor: float) -> void:
	var viewport := get_viewport()
	var mousePos := viewport.get_mouse_position()

	var beforeZoom := (mousePos - get_viewport_rect().size * 0.5) / zoom + position

	zoom *= factor
	zoom.x = clamp(zoom.x, minZoom, maxZoom)
	zoom.y = zoom.x

	var afterZoom := (mousePos - get_viewport_rect().size * 0.5) / zoom + position

	position += beforeZoom - afterZoom
