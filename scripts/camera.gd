extends Camera2D

# map drag logic
var dragging := false
var lastMousePos := Vector2.ZERO
var targetPosition := Vector2.ZERO
var moveSpeed := 12.0

# map zoom logic
var zoomStep := 0.02
var minZoom := 0.25
var maxZoom := 3.0
var targetZoom := Vector2.ONE
var zoomSpeed := 8.0

func _ready():
	targetPosition = position
	targetZoom = zoom

func _process(delta):
	position = position.lerp(targetPosition, moveSpeed * delta)
	zoom = zoom.lerp(targetZoom, zoomSpeed * delta)

func _input(event: InputEvent) -> void:
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

		targetPosition -= delta / zoom.x
		lastMousePos = currentMousePos

func zoomAtMouse(factor: float) -> void:
	var viewport := get_viewport()
	var mousePos := viewport.get_mouse_position()
	var screenCenter := get_viewport_rect().size * 0.5

	var worldBefore := (mousePos - screenCenter) / targetZoom + targetPosition

	var newZoom := targetZoom * factor
	newZoom.x = clamp(newZoom.x, minZoom, maxZoom)
	newZoom.y = newZoom.x

	var worldAfter := (mousePos - screenCenter) / newZoom + targetPosition

	targetZoom = newZoom
	targetPosition += worldBefore - worldAfter
