extends State
@onready var idle : State = $"../Idle"

func update():
	print(owner.name + " is other")
	if(Input.is_action_just_pressed("move_left")):
		state_machine.transition_to(idle)
