extends Area2D

#@onready var game_manager = %GameManager
@onready var pickup_sound = $PickupSound
@onready var animation_player = $AnimationPlayer
@onready var cpu_particles_2d = $CPUParticles2D


func _on_body_entered(_body):
	#pickup_sound.play()
	cpu_particles_2d.emitting = true
	GameManager.add_point() 
	animation_player.play("pickup")
