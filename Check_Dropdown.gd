extends OptionButton

export(NodePath) var dropdown_path
onready var dropdown = get_node(dropdown_path)

func _ready():
	# add items
	add_items()

func add_items():
	dropdown.add_item("           ")
	dropdown.add_item("Hint: Need ")
	dropdown.add_item("Hint:Ignore")
	dropdown.add_separator()
	dropdown.add_item("Gold Banana")
	dropdown.add_item("Ban. Medal ")
	dropdown.add_item("BattleCrown")
	dropdown.add_item("Blueprint  ")
	dropdown.add_item("Key        ")
	dropdown.add_item("Move       ")
	dropdown.add_item("N64 Coin   ")

