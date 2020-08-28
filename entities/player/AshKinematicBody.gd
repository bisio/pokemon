extends KinematicBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2() 
	if Input.is_key_pressed(KEY_UP):
		velocity.y = -1
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y = +1 
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x = -1
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x = +1

	self.move_and_collide(300*velocity.normalized()*delta)
	self.update_animations(velocity)	

func update_animations(velocity):
	if velocity.y == 1:
		$AnimatedSprite.play("walk_down")	
	elif velocity.y == -1:
		$AnimatedSprite.play("walk_up")
	elif velocity.x == -1:
		$AnimatedSprite.play("walk_left")
		$AnimatedSprite.flip_h = false
	elif velocity.x == 1:
		$AnimatedSprite.play("walk_left")
		$AnimatedSprite.flip_h = true
		
	if velocity == Vector2():
		if $AnimatedSprite.animation == "walk_down":
			$AnimatedSprite.play("stand_down")
		elif $AnimatedSprite.animation == "walk_up":
			 $AnimatedSprite.play("stand_up")
		elif $AnimatedSprite.animation == "walk_left":
			$AnimatedSprite.play("stand_left")
			
