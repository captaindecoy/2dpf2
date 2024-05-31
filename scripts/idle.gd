extends State
@onready var other : State = $"../Other"
@onready var exclamation_block = $"../.."

func update():
	print(exclamation_block.name + " is idle")
	exclamation_block.test_function()
	if(Input.is_action_just_pressed("move_right")):
		state_machine.transition_to(other)
