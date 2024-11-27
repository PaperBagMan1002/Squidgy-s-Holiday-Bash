extends Area2D
@export var player : HealthResource



func _on_body_entered(body:Node2D) -> void:
	print("Life")
	if player.health < 3:
		player.health +=1
		queue_free()
	
	
