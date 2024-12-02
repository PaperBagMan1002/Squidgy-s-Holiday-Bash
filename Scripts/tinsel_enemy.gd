extends Node2D

const SPEED = 20



var direction = -1
var awake

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var awakeTimer = $Timer
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if awake:
		animated_sprite.play("Move")
		if ray_cast_right.is_colliding():
			direction = -1
			animated_sprite.flip_h = false
		if ray_cast_left.is_colliding():
			direction = 1
			animated_sprite.flip_h = true
	
		position.x += direction * SPEED * delta
	


func _on_sensor_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		animated_sprite.play("Awake")
		awakeTimer.start()


func _on_timer_timeout() -> void:
	awake = true
