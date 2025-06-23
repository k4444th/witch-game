extends CharacterBody2D

var keyboardInputDirections := Vector2(0.0, 0.0)
var direction := Vector2(0.0, 0.0)

@export var speed := 100

func _process(_delta: float) -> void:
	getKeyboardInputs()
	setDirection()
	moveSprite()

func getKeyboardInputs():
	keyboardInputDirections.x = Input.get_axis("Left", "Right")
	keyboardInputDirections.y = Input.get_axis("Up", "Down")

func setDirection():
	if keyboardInputDirections.x == 0 and keyboardInputDirections.y == 0:
		direction.x = 0
		direction.y = 0
	else:
		if (keyboardInputDirections.x > 0 and keyboardInputDirections.y == 0):
			direction.x = keyboardInputDirections.x
			direction.y = keyboardInputDirections.x / 2
			%Sprite.animation = "front"
			%Sprite.flip_h = false
		elif (keyboardInputDirections.x < 0 and keyboardInputDirections.y == 0):
			direction.x = keyboardInputDirections.x
			direction.y = keyboardInputDirections.x / 2
			%Sprite.animation = "back"
			%Sprite.flip_h = true
		elif (keyboardInputDirections.x == 0 and keyboardInputDirections.y < 0):
			direction.x = -keyboardInputDirections.y
			direction.y = keyboardInputDirections.y / 2
			%Sprite.animation = "back"
			%Sprite.flip_h = false
		elif (keyboardInputDirections.x == 0 and keyboardInputDirections.y > 0):
			direction.x = -keyboardInputDirections.y
			direction.y = keyboardInputDirections.y / 2
			%Sprite.animation = "front"
			%Sprite.flip_h = true
	
func moveSprite():
	velocity = direction * speed
	move_and_slide()
