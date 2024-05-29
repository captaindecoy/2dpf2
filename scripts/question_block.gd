extends RigidBody2D
@onready var left_ray_cast_2d = $LeftRayCast2D
@onready var middle_ray_cast_2d = $MiddleRayCast2D
@onready var right_ray_cast_2d = $RightRayCast2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if left_ray_cast_2d.is_colliding() or middle_ray_cast_2d.is_colliding() or right_ray_cast_2d.is_colliding():
		print("Ray collided!")
		queue_free()
	pass
