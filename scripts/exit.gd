extends Area2D

func _on_body_entered(_body):
	print("Exit")
	#GameManager.next_level() #changed to call_deferred for safety and to remove errors
	call_deferred("gm_next_level")

func gm_next_level():
	GameManager.next_level()
	
