extends Area2D

@onready var game_manager = %GameManager
@onready var pickup_sound = $PickupSound
@onready var animation_player = $AnimationPlayer

func _on_body_entered(_body):
	#pickup_sound.play()
	game_manager.add_point()
	animation_player.play("pickup")
