extends Sprite



onready var zones = [
	false,
	false,
	false,
	false,
	false,
	false
]

onready var def_zones = zones


func _ready():
	highlight_zones()

func highlight_zones():
	var _x = 0
	for _i in self.get_children():
		_i.set_visible(zones[_x])
		_x += 1
		
func update_zone(index):
	var _flag = zones[index]
	zones = [
	false,
	false,
	false,
	false,
	false,
	false
	]
	if not _flag:
		zones[index] = !zones[index]
	highlight_zones()
