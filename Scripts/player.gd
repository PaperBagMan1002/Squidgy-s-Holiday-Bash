extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
@export var health : healthResource
@export var hitbox : Area2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var knockbackPower: int = 800


var atk : bool
var sHP

func _ready() -> void:
	#sets saved hp
	sHP = health.health
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if health.health > 0: 
		if health.health < sHP:
			velocity.y += (JUMP_VELOCITY/2.0)
			sHP = health.health
		elif health.health > sHP:
			sHP = health.health
		
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			animated_sprite.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("Move Left", "Move Right")
	
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		elif Input.is_action_pressed("Attack") and !is_on_floor():
			animated_sprite.play("Attack")
			atk = true
		elif !is_on_floor():
			animated_sprite.play("jump")
		if Input.is_action_just_released("Attack"):
			atk = false
		
		
	
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0: 
			animated_sprite.flip_h = true
		

	
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()
		
		
func knockback(tinselenemyVelocity: Vector2):
	var kb_direction = (tinselenemyVelocity - velocity).normalized() * knockbackPower
	velocity = kb_direction
	velocity.x -= 800
	
	move_and_slide()


func _on_hitbox_body_entered(body: Node2D) -> void:
	print(body)
	if body.is_in_group("Enemy") and atk:
		print("hit")
		body.queue_free()
