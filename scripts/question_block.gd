extends RigidBody2D
@onready var ray_cast_2d = $RayCast2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_2d.is_colliding():
		print("Ray collided!")
		queue_free()
	pass
