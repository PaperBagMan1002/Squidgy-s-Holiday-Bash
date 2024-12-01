extends Area2D
@export var player : healthResource
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	player.health -= 1

	if player.health <=0:
		body.get_node("CollisionShape2D").queue_free()
		Engine.time_scale = 0.5
		timer.start()
	
	

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	player.health = 3
