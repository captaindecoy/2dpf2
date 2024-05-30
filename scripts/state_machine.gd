class_name StateMachine
extends Node

@export var initial_state : State
@onready var current_state : State

func _ready(): #init doesn't work here, just a note
	current_state = initial_state
	for child in get_children():
		child.state_machine = self

func _enter_tree():
	print("this happens before the ready method!")
	
func _process(delta):
	current_state.update()
	
func transition_to(target_state):
	current_state = target_state
