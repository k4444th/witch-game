extends CharacterBody2D

# Movement variables
var direction := Vector2.ZERO
var initialSpeed := 500.0
var maxSpeed := 1000.0
var speed := initialSpeed

# Nodes (onready)
@onready var sprite := $Sprite

func _process(_delta: float) -> void:
	getKeyboardInputs()
	setAnimation()
	moveSprite()

func getKeyboardInputs():
	direction.x = Input.get_axis("Left", "Right")
	direction.y = Input.get_axis("Up", "Down")
	direction = direction.normalized()

func setAnimation():
	var animationString := "walk_" if direction else "idle_"
	
	if direction.x != 0:
		animationString += "side"
		
		if direction.x < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
	
	#elif direction.y < 0:
		#animationString += "back"
	
	else:
		animationString += "front"
	
	sprite.play(animationString)

func moveSprite():
	if direction == Vector2.ZERO:
		speed = initialSpeed
	else:
		velocity = direction * speed
		move_and_slide()
		if speed < maxSpeed:
				speed *= 1.025
