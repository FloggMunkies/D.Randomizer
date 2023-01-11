extends TextureButton

onready var index = 0

func update_mod(index):
	match index:
		1:
			self_modulate = Color(0, 1, 0, 1)
		2:
			self_modulate = Color(1, 1, 0, 1)
		3:
			self_modulate = Color(1, 0, 0, 1)
		_:
			self_modulate = Color(1, 1, 1, 1)

func _on_Shop_Check_Button_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			BUTTON_LEFT:
				index += 1
			BUTTON_RIGHT:
				index -= 1
		if index < 0:
			index = 3
		if index > 3:
			index = 0
		update_mod(index)


func _on_Level_Check_Button_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			BUTTON_LEFT:
				index += 1
			BUTTON_RIGHT:
				index -= 1
		if index < 0:
			index = 3
		if index > 3:
			index = 0
		update_mod(index)
