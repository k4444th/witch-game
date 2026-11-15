extends Node2D

# Click logic
var click := false
var drag = false

# Nodes (onready)
@onready var mapNode := $Map
@onready var witchNode := $Witch
@onready var cameraNode := $Camera
@onready var clickTimerNode := $ClickTimer

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if not drag:
			moveCursor()
	
	if event is InputEventMouseButton:
		if event.pressed:
			clickTimerNode.start()
			click = true
			drag = true
		elif not event.pressed:
			drag = false
			
			if click:
				handleClick()
			else:
				pass

func moveCursor():
	var clickPos = mapNode.tileNode.to_local(mapNode.tileNode.get_global_mouse_position())
	
	var tileSize = Vector2(mapNode.tileNode.tile_set.tile_size)
	var tileCoords = Vector2i(
		floori((clickPos.x + tileSize.x / 2) / tileSize.x),
		floori((clickPos.y + tileSize.y / 2) / tileSize.y),
	)
	
	mapNode.cursorNode.clear()
	mapNode.cursorNode.set_cell(tileCoords, 1, Vector2i(0, 0))

func handleClick():
	var clickPos = mapNode.tileNode.to_local(mapNode.tileNode.get_global_mouse_position())
	
	var tileSize = Vector2(mapNode.tileNode.tile_set.tile_size)
	var tileCoords = Vector2i(
		floori((clickPos.x - tileSize.x / 2) / tileSize.x),
		floori((clickPos.y - tileSize.y / 2) / tileSize.y),
	)
	
	getTilesFromTileCoords(tileCoords)

func getTilesFromTileCoords(tileCoords: Vector2i):
	var surroundingAtlasCoords := [
		mapNode.tileNode.get_cell_atlas_coords(tileCoords),
		mapNode.tileNode.get_cell_atlas_coords(tileCoords + Vector2i(1, 0)),
		mapNode.tileNode.get_cell_atlas_coords(tileCoords + Vector2i(0, 1)),
		mapNode.tileNode.get_cell_atlas_coords(tileCoords + Vector2i(1, 1))
	]
	
	
	var surroundingSourceIds := [
		mapNode.tileNode.get_cell_source_id(tileCoords) - 1,
		mapNode.tileNode.get_cell_source_id(tileCoords + Vector2i(1, 0)) - 1,
		mapNode.tileNode.get_cell_source_id(tileCoords + Vector2i(0, 1)) - 1,
		mapNode.tileNode.get_cell_source_id(tileCoords + Vector2i(1, 1)) - 1
	]
	
	var currentTile := []
	
	for i in range(4):
		var tiledata = mapNode.tiledata[surroundingSourceIds[i]]
		var atlasCoords = surroundingAtlasCoords[i]
		var tile = tiledata[atlasCoords[1]][atlasCoords[0]]
		currentTile.append(tile[floori((5.0 - i) / 2) - 1][(5 - i) % 2])
	
	print(currentTile)

func _on_click_timer_timeout() -> void:
	click = false
