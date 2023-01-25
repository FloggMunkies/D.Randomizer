extends CheckButton

onready var color = get_modulate()

func _ready():
	modulate = Color(1,1,1,1)
	self_modulate = Color(1,1,1,1)

func _process(delta):
	if InputEventMouseButton:
		if is_pressed():
			get_child(0).set_modulate(color)
		else:
			get_child(0).set_modulate(Color(0.9, 0.9, 0.9, 0.4))


#func _on_JJ_Button_pressed():
#	if is_pressed():
#		get_child(0).set_modulate(Color(0,1,0,1))
#	else:
#		get_child(0).set_modulate(Color(0,1,0,.5))
#
#
#func _on_AA_Button_pressed():
#	if is_pressed():
#		get_child(0).set_modulate(Color(1,1,0,1))
#	else:
#		get_child(0).set_modulate(Color(1,1,0,5))
