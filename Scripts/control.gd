extends CanvasLayer
@export var player: HealthResource
@export var box1 : TextureRect
@export var box2 : TextureRect
@export var box3 : TextureRect
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var on = load("res://Assets/Health Bar Sprites Full.png")
	var off = load("res://Assets/Health Bar Sprites.png")
	if player.health == 3:
		box1.texture = on
		box2.texture = on
		box3.texture = on 
	elif player.health == 2: 
		box1.texture = on
		box2.texture = on
		box3.texture = off
	elif player.health == 1:
		box1.texture = on 
		box2.texture = off
		box3.texture = off
		
