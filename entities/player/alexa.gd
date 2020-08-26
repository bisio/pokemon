extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	var velocity = Vector2() 
	if Input.is_key_pressed(KEY_W):
		velocity.y = -1
	if Input.is_key_pressed(KEY_S):
		velocity.y = +1 
	if Input.is_key_pressed(KEY_A):
		velocity.x = -1
	if Input.is_key_pressed(KEY_D):
		velocity.x = +1

	self.position =  self.position + 300*velocity.normalized()*delta
