extends Area2D

@onready var timer = $Timer
@onready var death_sound = $DeathSound


func _on_body_entered(body):
	print("you dead")
	death_sound.play()
	Engine.time_scale = 0.5
	body.get_node_or_null("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
	#GameManager.remove_child()
