extends Sprite

onready var available = false
onready var mask = 0
onready var previous_mask = 0

func _on_Dropdown_item_selected(index):
	if index != mask:
		previous_mask = mask
		mask = index

func _process(delta):
	if available != null:
		match mask:
			1:
				modulate = Color(1, 1, 0, 1)
			2:
				modulate = Color(1, 0, 0, 1)
			3:
				modulate = Color(0, 1, 0, 1)
			_: 
				modulate = Color(1, 1, 1, 1)
				visible=false
		if available:
			modulate = Color(1, 1, 0, 1)
			visible=true
	else:
		owner.visible = false
	
