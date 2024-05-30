extends State
@onready var other : State = $"../Other"

func update():
	print(owner.name + " is idle")
	if(Input.is_action_just_pressed("move_right")):
		state_machine.transition_to(other)
