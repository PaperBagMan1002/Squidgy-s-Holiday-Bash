extends Area2D




func _on_body_entered(body):
	print("Life")
	queue_free()
