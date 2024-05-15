extends Node

var score:int = 0
var current_scene:Node
@onready var score_label:Label = $ScoreLabel
@export var my_array:Array[PackedScene]

func _ready():
	get_tree().change_scene_to_packed(my_array[0])
	#pass
	#print(my_array[0].resource_path)
	
	#current_scene = my_array[0].instantiate()
	#add_child(current_scene)
	#var loading = get_node("/LoadingScene")
	#remove_child(get_tree().current_scene)
	
func add_point():
	score += 1
	score_label.text = "You have collected " + str(score) + " coins!"
	
func reload_level():
	remove_child(current_scene)
	add_child(current_scene)
