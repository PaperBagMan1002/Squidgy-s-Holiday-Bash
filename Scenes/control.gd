extends CanvasLayer

@export var bar:ProgressBar
@export var player:CharacterBody2D
@export var cam : Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bar.value = player.health
	#var pos = Vector2(cam.transform.origin.x-500,cam.transform.origin.y-400)
	#self.position = lerp(self.position,pos,.001)
