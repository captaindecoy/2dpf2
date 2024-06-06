extends Camera2D

@export var objectToFollow: Node2D;

func _physics_process(delta):
	update_camera();

func _process(delta):
	update_camera();

func update_camera():
	if is_instance_valid(objectToFollow):
		position = objectToFollow.position;
