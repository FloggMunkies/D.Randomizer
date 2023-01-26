extends CheckButton

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(0.5, 0.5, 0.5, 0.5)

func _process(_delta):
	if InputEventMouseButton:
		if is_pressed():
			modulate = Color(1, 1, 1, 1)
		else:
			modulate = Color(0.5, 0.5, 0.5, 0.5)
