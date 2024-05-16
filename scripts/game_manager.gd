extends Node

var score:int = 0
var current_scene:Node
var level_index:int = -1
@onready var score_label:Label = $ScoreLabel
@export var levels_array:Array[PackedScene]

func _ready():
	call_deferred("next_level")
	#get_tree().change_scene_to_packed(levels_array[level_index])
	#pass
	#print(levels_array[0].resource_path)
	
	#current_scene = levels_array[0].instantiate()
	#add_child(current_scene)
	#var loading = get_node("/LoadingScene")
	#remove_child(get_tree().current_scene)
	
func add_point():
	score += 1
	score_label.text = "You have collected " + str(score) + " coins!"
	
func reload_level():
	remove_child(current_scene)
	add_child(current_scene)
	
func next_level():
	level_index += 1
	get_tree().change_scene_to_packed(levels_array[level_index])
	print(levels_array[level_index].resource_path)
	
#func change_scene_deferred():
#	get_tree().change_scene_to_packed(levels_array[level_index])
