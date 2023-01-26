extends Button

var counter = 0
export var level = ""

signal update_logic

func _ready():
	self.modulate = Color(0.5, 0.5, 0.5, 0.5)
	var _c = connect("update_logic", get_tree().get_root().get_node("Main").get_node("TabContainer").get_node("Logic").get_node("Logic"), "update_level_logic")

func count(index):
	match index:
		
		1: counter += 1
		2: counter -= 1
		_: pass
	
	if counter > 2:
		counter = 0
	if counter < 0:
		counter = 2
	
	match counter:
		0: 
			self.modulate = Color(0.5, 0.5, 0.5, 0.5)
			$Label.text = "Closed"
		1: 
			self.modulate = Color(1, 1, 1, 1)
			$Label.text = "Lobby Open"
		2: 
			self.modulate = Color(1, 1, 1, 1)
			$Label.text = "Level Open"
		_: $Label.text = "IDK Man..."


func _on_Level_Lobby_Button_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		count(event.button_index)
		emit_signal("update_logic",level, counter)
