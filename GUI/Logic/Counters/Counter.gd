extends Button

var counter = 0
signal recheck_logic

func _ready():
	fancy()
	connect("recheck_logic", get_tree().get_root().get_node("Main").get_node("TabContainer").get_node("Logic").get_node("Logic"), "update")

func count(index):
	if index==1:
		counter+=1
	if index == 2:
		counter += -1
	
	if counter < 0:
		counter = 0
	
	$Label.text = str(counter)
	fancy()
	emit_signal("recheck_logic")

func fancy():
	if counter == 0:
		self.self_modulate = Color(.6, .6, .6, .6)
	else:
		self.self_modulate = Color(1, 1, 1, 1)
	

func _on_Counter_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		count(event.button_index)
