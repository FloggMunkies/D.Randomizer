extends OptionButton

export(NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)

func _ready():
	# add items
	add_items()

func add_items():
	dropdown.add_item("")
	dropdown.add_item("BP")
	dropdown.add_item("Coin")
	dropdown.add_item("Crown")
	dropdown.add_item("GB")
	dropdown.add_item("Key")
	dropdown.add_item("Kong")
	dropdown.add_item("Medal")
	dropdown.add_item("Move")
	dropdown.add_item("Other")


