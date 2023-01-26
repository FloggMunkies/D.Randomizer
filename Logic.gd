extends Node2D
onready var flags : Dictionary = {}

signal update_checks(check_dict)

func _ready():
	# Kongs
	flags["DK"] = false
	flags["Diddy"] = false
	flags["Lanky"] = false
	flags["Tiny"] = false
	flags["Chunky"] = false
	
	# Pads
	flags["DK_Pad"] = false
	flags["Diddy_Pad"] = false
	flags["Lanky_Pad"] = false
	flags["Tiny_Pad"] = false
	flags["Chunky_Pad"] = false
	
	# Guns
	flags["DK_Gun"] = false
	flags["Diddy_Gun"] = false
	flags["Lanky_Gun"] = false
	flags["Tiny_Gun"] = false
	flags["Chunky_Gun"] = false
	
	# Musics
	flags["DK_Music"] = false
	flags["Diddy_Music"] = false
	flags["Lanky_Music"] = false
	flags["Tiny_Music"] = false
	flags["Chunky_Music"] = false
	
	# Special Moves
	flags["DK_Move"] = false
	flags["Diddy_Move"] = false
	flags["Lanky_Move"] = false
	flags["Tiny_Move"] = false
	flags["Chunky_Move"] = false
	
	# Barrels
	flags["DK_Barrel"] = false
	flags["Diddy_Barrel"] = false
	flags["Lanky_Barrel"] = false
	flags["Tiny_Barrel"] = false
	flags["Chunky_Barrel"] = false
	
	# Moves
	flags["Swim"] = false
	flags["Vine"] = false
	flags["Sniper"] = false
	flags["Super_Slam"] = false
	flags["Super_Duper_Slam"] = false
	flags["Barrel_Throw"] = false
	flags["Orange"] = false
	
	# Levels
	flags["japes"] = false
	flags["aztec"] = false
	flags["factory"] = false
	flags["galleon"] = false
	flags["forest"] = false
	flags["caves"] = false
	flags["castle"] = false
	
	# Lobbies
	flags["japes_lobby"] = false
	flags["aztec_lobby"] = false
	flags["factory_lobby"] = false
	flags["galleon_lobby"] = false
	flags["forest_lobby"] = false
	flags["caves_lobby"] = false
	flags["castle_lobby"] = false
	
	# Misc Checks
	flags["Japes_Kong"] = false 
	flags["key_2"] = false 
	flags["key_6"] = false 
	flags["key_7"] = false 
	
	
	
	# REAL SETTINGS (Set to suggested default)
#	flags["Glitchless_Logic"] = true
	flags["Activate_Bananaports_Isles"] = true
	flags["Shuffle_Shop_Locations"] = true # No logic for shops currently
#	flags["Item_Randomizer"] = false
	flags["Shuffle_Kasplats"] = true # Vanilla Locations (Doesnt affect logic)
#	flags["Move_Randomizer"] = true # Shuffle
	flags["Training_Barrels"] = false # Vanilla / Shuffled (Doesnt affect logic, just need buttons to auto-turn on)
	flags["Banana_Fairy_Isle"] = false # Seperate (Doesnt affect logic, 201'st banana isnt listed in checks)
	flags["Shuffle_Bananaports"] = true # In-Level (May cause logic issues with active ports and shuffled, currently only looking at Isles only)
	flags["Autocomplete_Bonus_Barrels"] = false # NO LONGER BYPASSES CHECKS 12/20/22
	flags["Open_Lobbies"] = false # affects logic for Isles checks, currently assuming level and lobby flag tied together
	flags["Open_Levels"] = false # Doesn't affect logic, just need to auto turn on buttons
	flags["Remove_High_Requirments"] = true 
		# Aztec 5 Door temple switches active and buzzard race ready
		# Factory Prod Room Powered On
		# Galleon K Rool Ship Spawned in Lighthouse
		# Caves Igloo Music Pads Spawned
#	flags["Tag_Anywhere"] = true
	
	# MY SETTINGS
#	flags["Glitchless_Logic"] = true
#	flags["Activate_Bananaports_Isles"] = false
#	flags["Shuffle_Shop_Locations"] = true
#	flags["Item_Randomizer"] = true
#	flags["Shuffle_Kasplats"] = true # Vanilla Locations
#	flags["Move_Randomizer"] = true # Shuffle
#	flags["Training_Barrels"] = true # Vanilla / Shuffled
#	flags["Banana_Fairy_Isle"] = true # Seperate
#	flags["Shuffle_Bananaports"] = false # In-Level
#	flags["Autocomplete_Bonus_Barrels"] = true
#	flags["Open_Lobbies"] = false
#	flags["Open_Levels"] = false
#	flags["Remove_High_Requirments"] = true 
#		# Aztec 5 Door temple switches active and buzzard race ready
#		# Factory Prod Room Powered On
#		# Galleon K Rool Ship Spawned in Lighthouse
#		# Caves Igloo Music Pads Spawned
#	flags["Tag_Anywhere"] = true
	
	# Level Subareas / Specific Flag Combos
	flags["Aztec_Main"] = false
	flags["Aztec_Tower"] = false
	flags["Factory_Power"] = false
	flags["Forest_Night"] = false
	flags["Galleon_Water"] = false
	flags["Galleon_Ship"] = false
	flags["Caves_Igloo"] = false
	flags["Japes_Alcove"] = false
	flags["Aztec_Ice_Melt"] = false
	flags["Main_Galleon"] = false
	flags["Forest_Top_Mushroom"] = false
	flags["Llama_Temple"] = false
#	flags["Isles_Snide_Diddy"] = false
	flags["Factory_Lanky_Pad"] = false
	flags["Isles_Aztec_Lobby"] = false
	flags["Castle_Chunky_Greenhouse"] = false
	flags["Helm_Access"] = false
	
	update()
	

func flip(key, dict=flags):
	dict[key] = not dict[key]
	print(key, " ", dict[key])
	update()

func update():
	var check_dict
	special_flags_update()
	check_dict = test()
#	var settings = [flags["Activate_Bananaports_Isles"],
#	flags["Shuffle_Shop_Locations"],
#	flags["Shuffle_Kasplats"],
#	flags["Training_Barrels"],
#	flags["Banana_Fairy_Isle"],
#	flags["Shuffle_Bananaports"],
#	flags["Autocomplete_Bonus_Barrels"],
#	flags["Open_Lobbies"],
#	flags["Open_Levels"],
#	flags["Remove_High_Requirments"]
#	]
	emit_signal("update_checks", check_dict)

func update_level_logic(level, flag):
	print(level, flag)
	match flag:
		0:
			match level:
				"japes": 
					flags["japes"] = false
					flags["japes_lobby"] = false
				"aztec": 
					flags["aztec"] = false
					flags["aztec_lobby"] = false
				"factory": 
					flags["factory"] = false
					flags["factory_lobby"] = false
				"galleon": 
					flags["galleon"] = false
					flags["galleon_lobby"] = false
				"forest": 
					flags["forest"] = false
					flags["forest_lobby"] = false
				"caves": 
					flags["caves"] = false
					flags["caves_lobby"] = false
				"castle": 
					flags["castle"] = false
					flags["castle_lobby"] = false
		1:
			match level:
				"japes": 
					flags["japes"] = false
					flags["japes_lobby"] = true
				"aztec": 
					flags["aztec"] = false
					flags["aztec_lobby"] = true
				"factory": 
					flags["factory"] = false
					flags["factory_lobby"] = true
				"galleon": 
					flags["galleon"] = false
					flags["galleon_lobby"] = true
				"forest": 
					flags["forest"] = false
					flags["forest_lobby"] = true
				"caves": 
					flags["caves"] = false
					flags["caves_lobby"] = true
				"castle": 
					flags["castle"] = false
					flags["castle_lobby"] = true
			
		2:
			match level:
				"japes": 
					flags["japes"] = true
					flags["japes_lobby"] = true
				"aztec": 
					flags["aztec"] = true
					flags["aztec_lobby"] = true
				"factory": 
					flags["factory"] = true
					flags["factory_lobby"] = true
				"galleon": 
					flags["galleon"] = true
					flags["galleon_lobby"] = true
				"forest": 
					flags["forest"] = true
					flags["forest_lobby"] = true
				"caves": 
					flags["caves"] = true
					flags["caves_lobby"] = true
				"castle": 
					flags["castle"] = true
					flags["castle_lobby"] = true
	update()

func test():
	var check_dict = {}
	check_dict["DK Isles"] = [
		# DK
		true, # GB 1 - Free
		(flags["DK"] and flags["DK_Gun"] and (flags["key_2"] or flags["Activate_Bananaports_Isles"] or (flags["Tiny"] and flags["Tiny_Pad"]))), # GB 2 - Gun Switch
		(flags["DK"] and (flags["factory_lobby"] or flags["Open_Lobbies"]) and flags["DK_Move"] and flags["DK_Music"]), # GB 3 - Factory Lobby
		(flags["DK"] and (flags["caves_lobby"] or flags["Open_Lobbies"]) and flags["Chunky"] and flags["Chunky_Move"] 
			and flags["Barrel_Throw"] and flags["DK_Barrel"]), # GB 4 - Caves Lobby
		null, # Null
		# Diddy
		(flags["Diddy"] and flags["Diddy_Barrel"] and flags["Lanky"] and flags["Lanky_Music"] 
		and flags["Chunky"] and flags["Barrel_Throw"] and (flags["Vine"] or flags["Activate_Bananaports_Isles"])), # GB 1 - Jetpack DK Head
		(flags["Diddy"] and flags["Diddy_Barrel"] and flags["Diddy_Gun"] and flags["Lanky"] 
		and flags["Lanky_Music"] and flags["Chunky"] and flags["Barrel_Throw"] and (flags["Vine"] or flags["Activate_Bananaports_Isles"])), # GB 2 - Gun Switch
		(flags["Diddy"] and (flags["Diddy_Pad"] or flags["Autocomplete_Bonus_Barrels"]) and (flags["key_2"] or flags["Activate_Bananaports_Isles"] or (flags["Tiny"] and flags["Tiny_Pad"]))), # GB 3 - Snide Pad
		(flags["Diddy"] and flags["Diddy_Barrel"] and flags["Diddy_Music"] and (flags["caves_lobby"] or flags["Open_Lobbies"])), # GB 4 - Caves Lobby
		null, # Null
		# Lanky
		(flags["Lanky"] and (flags["japes_lobby"] or flags["Open_Lobbies"]) and flags["Chunky"] and flags["Barrel_Throw"] and flags["Lanky_Music"]), # GB 1 - Japes lobby
		(flags["Lanky"] and flags["Lanky_Gun"]), # GB 2 - Gun Switch
		(flags["Lanky"] and flags["Lanky_Barrel"]), # GB 3 - K Lumsy Barrel
		(flags["Lanky"] and (flags["castle_lobby"] or flags["Open_Lobbies"]) and flags["Chunky"] and flags["Barrel_Throw"] and flags["Lanky_Pad"]), # GB 4 - Castle Lobby
		null, # Null
		# Tiny
		(flags["Tiny"] and flags["Tiny_Gun"]), # GB 1 - Gun Switch
		(flags["Tiny"] and (flags["Isles_Aztec_Lobby"] or flags["Autocomplete_Bonus_Barrels"])), # GB 2 - Aztec Lobby
		(flags["Tiny"] and (flags["galleon_lobby"] or flags["Open_Lobbies"]) and flags["Chunky"] and flags["Swim"] and flags["Super_Slam"] and flags["Tiny_Barrel"] and flags["Tiny_Barrel"]), # GB 3 Galleon Lobby
		(flags["Tiny"] and flags["Tiny_Pad"] and flags["Tiny_Music"]), # GB 4 MonkeyPort
		(flags["Tiny"] and flags["Tiny_Barrel"]), # Banana Fairy
		# Chunky
		(flags["Chunky"] and flags["Chunky_Gun"]), # GB 1 - Gun Switch
		(flags["Chunky"] and flags["Chunky_Music"] and flags["Barrel_Throw"] and (flags["Vine"] or flags["Activate_Bananaports_Isles"])), # GB 2 - Music Pad
		(flags["Chunky"] and flags["Tiny"] and flags["Tiny_Pad"] and flags["Tiny_Music"] and flags["Chunky_Barrel"] and flags["Barrel_Throw"]), # GB 3 - Giant Rock
		(flags["Chunky"] and flags["Chunky_Pad"] and flags["key_2"] and flags["key_6"] and flags["key_7"]), # GB 4 - Helm Lobby
		null, # Null
		# Kasplat
#		(flags["Helm_Access"] and flags["Tiny"] and flags["Tiny_Move"]), # DK Helm Lobby
		((flags["key_2"] or (flags["Tiny"] and flags["Tiny_Pad"]))  and (flags["Open_Lobbies"] or (flags["key_6"] and flags["key_7"])) and ((flags["Tiny"] and flags["Tiny_Move"]) or flags["Vine"])), # DK Helm Lobby
		(flags["DK"] and flags["DK_Gun"] and (flags["castle_)lobby"] or flags["Open_Lobbies"])), # Diddy Castle Lobby
		(flags["Chunky"] and flags["Chunky_Move"] and (flags["caves_lobby"] or flags["Open_Lobbies"])), # Lanky Caves Lobby
		(flags["Chunky"] and flags["Chunky_Move"] and (flags["factory_lobby"] or flags["Open_Lobbies"])), # Tiny Factory Lobby
		(flags["galleon"]), # Chunky Galleon Lobby
		
		# Misc Checks (Logic for Vanilla Location)
		# Cranky
		true,
		# Funky
		false,
		# Candy
		false,
		# Snide
		(flags["key_2"] or flags["Activate_Bananaports_Isles"] or (flags["Tiny"] and flags["Tiny_Pad"])),
		# Battlepad
		(flags["key_2"] or flags["Activate_Bananaports_Isles"] or (flags["Tiny"] and flags["Tiny_Pad"])), # Snide Area
		# Boss (Battlepad 2)
		false, # TODO Make ALL KONG GUN special flag (All Kong Gun, Gorilla Gone)
		# Rareware / Nintendo Coin
		(get_node("Counters/BM_Counter").counter >= 5) # TODO make equal to Cranky above, plus Banana Medal requirments
		]
	check_dict["Jungle Japes"] = [
		# DK
		flags["japes"], # GB 1 - Free Diddy
		flags["japes"], # GB 2 - Free Diddy
		(flags["japes"] and flags["DK"] and flags["DK_Gun"]), # GB 3 - Rambi Hut
		(flags["japes"] and flags["DK"] and flags["DK_Pad"] and flags["Vine"]), # GB 4 - DK Pad
		(flags["japes"] and flags["DK"]), # Banana Medal
		# Diddy
		(flags["japes"] and flags["Diddy"] and flags["Japes_Alcove"]), # GB 1 - Entrance Alcove
		(flags["japes"] and flags["Diddy"] and flags["DK"] and flags["DK_Gun"] and flags["Japes_Kong"]), # GB 2 - Rambi
		(flags["japes"] and flags["Diddy"] and flags["Diddy_Gun"]), # GB 3 - Anthill
		(flags["japes"] and flags["Diddy"] and flags["Diddy_Gun"] and flags["Diddy_Move"]), # GB 4 - Mine Cart Race
		(flags["japes"] and flags["Diddy"]), # Banana Medal
		# Lanky
		(flags["japes"] and flags["Lanky"] and flags["DK"] and flags["DK_Gun"] and flags["Japes_Kong"]), # GB 1 - Rambi
		(flags["japes"] and flags["Lanky"] and flags["Lanky_Move"] and flags["Japes_Kong"]), # GB 2 - Steep Slope
		(flags["japes"] and flags["Lanky"] and flags["Japes_Alcove"] and flags["Lanky_Gun"]), # GB 3 - Alcove
		(flags["japes"] and flags["Lanky"] and (flags["Lanky_Move"] or (flags["Tiny"] and flags["Tiny_Move"])) and flags["Diddy"] and flags["Diddy_Gun"]), # GB 4 - Diddy Gun
		(flags["japes"] and flags["Lanky"]), # Banana Medal
		# Tiny
		(flags["japes"] and flags["Tiny"] and flags["Japes_Alcove"] and flags["Tiny_Gun"]), # GB 1 - alcove
		(flags["japes"] and flags["Tiny"] and flags["DK"] and flags["DK_Gun"] and flags["Japes_Kong"]), # GB 2 -rambi
		(flags["japes"] and flags["Tiny"] and flags["Tiny_Gun"] and flags["Tiny_Barrel"] and flags["Japes_Kong"]), # GB 3 - tiny area
		(flags["japes"] and flags["Tiny"] and flags["Tiny_Gun"] and flags["Tiny_Barrel"] and flags["Japes_Kong"]), # GB 4 - tiny beehive
		(flags["japes"] and flags["Tiny"]), # Banana Medal
		# Chunky
		(flags["japes"] and flags["Chunky"] and flags["Barrel_Throw"]), # GB 1 boulder
		(flags["japes"] and flags["Chunky"] and flags["Barrel_Throw"] and flags["Vine"] and flags["Chunky_Gun"]), # GB 2 underground
		(flags["japes"] and flags["Chunky"] and flags["DK"] and flags["DK_Gun"] and flags["Japes_Kong"] and flags["Barrel_Throw"] and flags["Japes_Kong"]), # GB 3 rambi side area
		(flags["japes"] and flags["Chunky"] and flags["Chunky_Barrel"] and flags["Tiny"] and flags["Tiny_Gun"] and flags["Japes_Kong"]), # GB 4 tiny area
		(flags["japes"] and flags["Chunky"]), # Banana Medal
		# Kasplat
		(flags["japes"] and flags["Japes_Kong"]), # DK tiny area
		(flags["japes"] and flags["Japes_Kong"]), # Diddy minecart exit cave
		(flags["japes"] and flags["Japes_Kong"]), # Lanky cranky caves
		(flags["japes"] and flags["Japes_Kong"]), # Tiny tiny area cave 2
		(flags["japes"] and flags["Chunky"] and flags["Barrel_Throw"] and flags["Vine"] and flags["Chunky_Gun"]), # Chunky underground
		
		# Misc Checks (Currently Vanilla Location Logic)
		# Cranky
		(flags["japes"] and flags["Japes_Kong"]),
		# Funky
		(flags["japes"]),
		# Candy
		false,
		# Snide
		(flags["japes"]),
		# Battlepad
		(flags["japes"]),
		# Boss (Battlepad 2)
		(flags["japes"]), 
		# Rareware / Nintendo Coin
		false
		]
		
	check_dict["Angry Aztec"] = [
		# DK
		(flags["aztec"] and flags["DK"] and flags["DK_Pad"] and flags["Aztec_Main"]), # GB 1 - Pad
		(flags["aztec"] and flags["DK"] and flags["Llama_Temple"] and flags["DK_Music"]), # GB 2 - Llama Temple
		(flags["aztec"] and flags["DK"] and flags["Llama_Temple"] and flags["DK_Barrel"]), # GB 3 - Llama Temple Switch Cave
		(flags["aztec"] and flags["DK"] and flags["Aztec_Main"] and flags["Aztec_Tower"] and flags["DK_Gun"]), # GB 4 - Gun Temple
		(flags["aztec"] and flags["DK"]), # Banana Medal
		# Diddy
		(flags["aztec"] and flags["Aztec_Ice_Melt"] and flags["Swim"] and ((flags["Diddy"]  and flags["Diddy_Gun"] and flags["Diddy_Move"]) or (flags["Chunky"]  and flags["Chunky_Gun"] and flags["Chunky_Move"]))), # GB 1 - Free Tiny
		(flags["aztec"] and flags["Diddy"] and flags["Aztec_Main"] and flags["Diddy_Move"] and flags["Diddy_Barrel"]), # GB 2 - Gong Tower
		(flags["aztec"] and flags["Diddy"] and flags["Aztec_Tower"] and flags["Diddy_Gun"] and flags["Aztec_Main"]), # GB 3 - Gun Temple
		(flags["aztec"] and flags["Diddy"] and flags["Diddy_Barrel"] and flags["Aztec_Tower"] and flags["Aztec_Main"]), # GB 4 - Buzzard Race
		(flags["aztec"] and flags["Diddy"]), # Banana Medal
		# Lanky
		(flags["aztec"] and flags["Lanky"] and flags["Swim"] and flags["Aztec_Ice_Melt"] and flags["Lanky_Gun"]), # GB 1 - First Temple
		(flags["aztec"] and flags["Lanky"] and flags["Lanky_Gun"] and flags["Aztec_Main"]), # GB 2 - Llama Temple Puzzle
		(flags["aztec"] and flags["Lanky"] and flags["Llama_Temple"] and flags["Lanky_Move"] and flags["Lanky_Music"]), # GB 3 - LLama Temple
		(flags["aztec"] and flags["Lanky"] and flags["Aztec_Tower"] and  flags["Lanky_Gun"] and flags["Aztec_Main"]), # GB 4 - Gun Temple
		(flags["aztec"] and flags["Lanky"]), # Banana Medal
		# Tiny
		(flags["aztec"] and flags["Tiny"] and flags["Aztec_Ice_Melt"] and flags["Tiny_Barrel"] and flags["Swim"]), # GB 1 - First Temple
		(flags["aztec"] and flags["Tiny"] and flags["Llama_Temple"] and flags["Tiny_Barrel"] and flags["Tiny_Gun"] and flags["Tiny_Move"]), # GB 2 - Llama Temple
		(flags["aztec"] and flags["Tiny"] and flags["Aztec_Main"] and flags["Tiny_Barrel"] and flags["Tiny_Music"] and flags["Diddy_Move"]), # GB 3 - bug race
		(flags["aztec"] and flags["Tiny"] and flags["Tiny_Gun"] and flags["Aztec_Main"] and flags["Tiny_Barrel"]), # GB 4 - gun temple
		(flags["aztec"] and flags["Tiny"]), # Banana Medal
		# Chunky
		(flags["aztec"] and flags["Chunky"] and flags["Chunky_Gun"] and flags["Barrel_Throw"]), # GB 1 - vase puzzle
		(flags["aztec"] and flags["Chunky"] and flags["Chunky_Music"] and flags["Chunky_Gun"]), # GB 2 - first temple
		(flags["aztec"] and flags["Chunky"] and flags["Aztec_Main"] and flags["Chunky_Barrel"] and flags["Barrel_Throw"]), # GB 3 - large boulder
		(flags["aztec"] and flags["Chunky"] and flags["Aztec_Tower"] and flags["Aztec_Main"] and flags["Chunky_Gun"]), # GB 4 - gun temple
		(flags["aztec"] and flags["Chunky"]), # Banana Medal
		# Kasplat
		(flags["aztec"] and flags["DK"] and flags["DK_Gun"]), # DK entrance alcove
		(flags["aztec"] and flags["Diddy"] and flags["Diddy_Barrel"]), # Diddy top first temple
		(flags["aztec"] and flags["Llama_Temple"] and flags["Tiny"] and flags["Tiny_Barrel"]), # Lanky llama temple
		(flags["aztec"] and flags["Aztec_Main"]), # Tiny cranky cave
		(flags["aztec"] and flags["Chunky"] and flags["Aztec_Tower"] and flags["Chunky_Gun"] and flags["Aztec_Main"]), # Chunky gun temple

		# Misc Checks (Currently Vanilla Location Logic)
		# Cranky
		(flags["aztec"] and flags["Aztec_Main"]),
		# Funky
		(flags["aztec"] and flags["Aztec_Main"]),
		# Candy
		(flags["aztec"]),
		# Snide
		(flags["aztec"] and flags["Aztec_Main"]),
		# Battlepad
		(flags["aztec"] and true and flags["Lanky"] and flags["Lanky_Gun"] and flags["Swim"]), # TODO Tiny Temple Special Flag
		# Boss (Battlepad 2)
		(flags["aztec"]), 
		# Rareware / Nintendo Coin
		false
		]
	check_dict["Frantic Factory"] = [
		# DK
		(flags["factory"] and flags["DK"] and flags["DK_Pad"]), # GB 1 - Arcade
		(flags["factory"] and flags["DK"]), # GB 2 - Number Puzzle
		(flags["factory"] and flags["DK"] and flags["DK_Gun"] and (flags["Remove_High_Requirments"] or flags["DK_Move"])), # GB 3 - Power Room
		(flags["factory"] and flags["Factory_Power"] and flags["DK"] and flags["DK_Barrel"]), # GB 4 - Production Room Barrel
		(flags["factory"] and flags["DK"]), # Banana Medal
		# Diddy
		(flags["factory"] and flags["Factory_Power"] and flags["Diddy"] and flags["Diddy_Pad"]), # GB 1 - Production Pad
		(flags["factory"] and flags["Diddy"] and flags["Diddy_Pad"]), # GB 2 - ABC Pad
		(flags["factory"] and flags["Diddy"] and flags["Diddy_Music"] and flags["Diddy_Move"]), # GB 3 - R&D Puzzle
		(flags["factory"] and flags["Diddy"] and (flags["Vine"] or flags["Autocomplete_Bonus_Barrels"])), # GB 4 - Power Room
		(flags["factory"] and flags["Diddy"]), # Banana Medal
		# Lanky
		(flags["factory"] and flags["Factory_Power"] and flags["Lanky"] and flags["Lanky_Move"]), # GB 1 - Production Room
		(flags["factory"]), # GB 2 - Free Chunky
		(flags["factory"] and flags["Lanky"] and flags["Factory_Lanky_Pad"]), # GB 3 - ABC Pad
		(flags["factory"] and flags["Lanky"] and flags["Lanky_Music"]), # GB 4 - R&D Puzzle
		(flags["factory"] and flags["Lanky"]), # Banana Medal
		# Tiny
		(flags["factory"] and flags["Factory_Power"] and flags["Tiny"] and flags["Tiny_Move"]), # GB 1 - prod room
		(flags["factory"] and flags["Tiny"] and flags["Tiny_Barrel"]), # GB 2 - arcade room
		(flags["factory"] and flags["Tiny"] and flags["Tiny_Barrel"] and flags["Tiny_Gun"]), # GB 3 -dart game
		(flags["factory"] and flags["Tiny"] and flags["Tiny_Barrel"]), # GB 4 - race
		(flags["factory"] and flags["Tiny"]), # Banana Medal
		# Chunky
		(flags["factory"] and flags["Factory_Power"] and flags["Chunky"]), # GB 1 - prod switch
		(flags["factory"] and flags["Chunky"] and flags["Chunky_Move"]), # GB 2 - platforms
		(flags["factory"] and flags["Chunky"] and flags["Chunky_Move"]), # GB 3 - gate
		(flags["factory"] and flags["Chunky"] and flags["Chunky_Move"] and flags["Chunky_Music"] and flags["Chunky_Barrel"]), # GB 4 - R&D fight
		(flags["factory"] and flags["Chunky"]), # Banana Medal
		# Kasplat
		(flags["factory"] and flags["Factory_Power"]), # DK production top
		(flags["factory"]), # Diddy production floor
		(flags["factory"]), # Lanky R&D
		(flags["factory"]), # Tiny Free Chunky pole
		(flags["factory"]), # Chunky ABC Room

		# Misc Checks (Currently Vanilla Location Logic)
		# Cranky
		(flags["factory"]),
		# Funky
		(flags["factory"]),
		# Candy
		(flags["factory"]),
		# Snide
		(flags["factory"]),
		# Battlepad
		(flags["factory"] and flags["DK"] and flags["DK_Move"]), # Gorilla Grab
		# Boss (Battlepad 2)
		(flags["factory"]), 
		# Rareware / Nintendo Coin
		(flags["factory"] and flags["DK"] and flags["DK_Move"] and flags["DK_Pad"]), # Arcade (Baboon Blast, Gorilla Grab)
		]
		
	check_dict["Gloomy Galleon"] = [
		# DK
		(flags["galleon"] and flags["Galleon_Water"] and flags["DK"] and flags["DK_Gun"] and (flags["DK_Move"] or flags["Remove_High_Requirments"])), # GB 1 - Lighthouse
		(flags["galleon"] and flags["Galleon_Water"] and flags["DK"] and flags["DK_Pad"] and flags["DK_Gun"]), # GB 2 - Lighthouse Pad
		(flags["galleon"] and flags["Galleon_Water"] and flags["DK"] and flags["DK_Pad"] and flags["DK_Gun"]), # GB 3 - Seal Race
		(flags["galleon"] and flags["DK"] and flags["DK_Music"] and flags["Main_Galleon"] and flags["Swim"]), # GB 4 - Music Pad Sunk Ship
		(flags["galleon"] and flags["DK"]), # Banana Medal
		# Diddy
		(flags["galleon"] and flags["Diddy"] and flags["Diddy_Barrel"]  and flags["Galleon_Ship"]), # GB 1 - Lighthouse Ship
		(flags["galleon"] and flags["Diddy"] and flags["Main_Galleon"] and flags["Diddy_Barrel"] and flags["Diddy_Music"] and flags["Diddy_Gun"] and flags["Swim"]), # GB 2 - Lighthouse Music
		(flags["galleon"] and flags["Diddy"] and flags["Main_Galleon"] and flags["Diddy_Music"] and flags["Swim"]), # GB 3 - Sunk Ship Music
		(flags["galleon"] and flags["Diddy"] and flags["Diddy_Pad"] and flags["Galleon_Water"]), # GB 4 - Gold Pile
		(flags["galleon"] and flags["Diddy"]), # Banana Medal
		# Lanky
		(flags["galleon"] and flags["Lanky"] and flags["Swim"] and flags["Main_Galleon"]), # GB 1 - Sunk Ship
		(flags["galleon"] and flags["Lanky"] and flags["Galleon_Water"] and flags["Lanky_Pad"] and flags["Main_Galleon"]), # GB 2 - Gold Pile
		(flags["galleon"] and flags["Lanky"] and flags["Main_Galleon"] and flags["Lanky_Music"]), # GB 3 - Sunk Ship Music
		(flags["galleon"] and flags["Lanky"] and flags["Galleon_Water"]), # GB 4 - Engaurde
		(flags["galleon"] and flags["Lanky"]), # Banana Medal
		# Tiny
		(flags["galleon"] and flags["Tiny"] and flags["Main_Galleon"] and flags["Swim"]), # GB 1 - sunk ship
		(flags["galleon"] and flags["Tiny"] and flags["Tiny_Barrel"] and flags["Main_Galleon"] and flags["Swim"]), # GB 2 - underwater
		(flags["galleon"] and flags["Tiny"] and flags["Tiny_Music"] and flags["Tiny"] and flags["Swim"] and flags["Main_Galleon"]), # GB 3 - Music sunk ship
		(flags["galleon"] and flags["Tiny"] and flags["Main_Galleon"] and flags["Tiny_Barrel"] and flags["Swim"] and flags["Galleon_Water"]), # GB 4 - gold pile
		(flags["galleon"] and flags["Tiny"]), # Banana Medal
		# Chunky
		(flags["galleon"] and flags["Chunky"] and flags["Galleon_Water"] and flags["Chunky_Gun"] and flags["Barrel_Throw"]), # GB 1 - cannon
		(flags["galleon"] and flags["Chunky"] and flags["Galleon_Ship"] and flags["Chunky_Move"]), # GB 2 - ship room
		(flags["galleon"] and flags["Chunky"] and flags["Chunky_Move"]), # GB 3 - chests
		(flags["galleon"] and flags["Chunky"] and flags["Chunky_Music"] and flags["Main_Galleon"] and flags["DK"] and flags["DK_Gun"] and flags["Swim"]), # GB 4 - sunk ship lighthouse
		(flags["galleon"] and flags["Chunky"]), # Banana Medal
		# Kasplat
		(flags["galleon"] and flags["Galleon_Water"] and flags["Main_Galleon"] and flags["Diddy"] and flags["Diddy_Pad"]), # DK Gold Pile
		(flags["galleon"] and flags["DK"] and flags["DK_Gun"]), # Diddy Lighthouse
		(flags["galleon"] and flags["Galleon_Water"] and flags["Chunky"] and flags["Chunky_Gun"]), # Lanky Cannon
		(flags["galleon"] and flags["Vine"]), # Tiny Cranky Cannon
		(flags["galleon"] and flags["Main_Galleon"]), # Chunky Music Pads

		# Misc Checks (Currently Vanilla Location Logic)
		# Cranky
		(flags["galleon"] and flags["Vine"]),
		# Funky
		(flags["galleon"] and flags["Main_Galleon"]),
		# Candy
		(flags["galleon"] and flags["Main_Galleon"]),
		# Snide
		(flags["galleon"] and flags["Galleon_Water"]),
		# Battlepad
		(flags["galleon"] and flags["Chunky"] and flags["Chunky_Move"]), 
		# Boss (Battlepad 2)
		(flags["galleon"]), 
		# Rareware / Nintendo Coin
		false, 
		]
	
	check_dict["Fungi Forest"] = [
		# DK
		(flags["forest"] and flags["DK"] and flags["DK_Move"] and flags["Super_Slam"] and flags["Forest_Night"]), # GB 1 - Mill Puzzle
		(flags["forest"] and flags["DK"] and flags["Forest_Night"] and flags["Super_Slam"]), # GB 2 - Night Thorn
		(flags["forest"] and flags["DK"] and flags["DK_Gun"]
		 and flags["Diddy"] and flags["Diddy_Gun"]
		 and flags["Lanky"] and flags["Lanky_Gun"]
		 and flags["Tiny"] and flags["Tiny_Gun"]
		 and flags["Chunky"] and flags["Chunky_Gun"]), # GB 3 - Mushroom Guns
		(flags["forest"] and flags["DK"] and flags["DK_Pad"]), # GB 4 - Mushroom Pad
		(flags["forest"] and flags["DK"]), # Banana Medal
		# Diddy
		(flags["forest"] and flags["Diddy"] and flags["Diddy_Gun"] and flags["Diddy_Music"] and flags["Diddy_Move"] and flags["Super_Slam"]), # GB 1 - Mill
		(flags["forest"] and flags["Diddy"] and flags["Diddy_Pad"] and flags["Diddy_Music"] and flags["Forest_Night"]), # GB 2 - Near Mill Night
		(flags["forest"] and flags["Diddy"] and flags["Diddy_Barrel"]), # GB 3 Top Mushroom
		(flags["forest"] and flags["Diddy"] and flags["Forest_Night"] and flags["Diddy_Barrel"] and flags["Lanky"] and flags["Lanky_Gun"] and flags["Diddy_Music"]), # GB 4 - Owl Race
		(flags["forest"] and flags["Diddy"]), # Banana Medal
		# Lanky
		(flags["forest"] and flags["Lanky"] and flags["Lanky_Gun"] and flags["Forest_Night"] and flags["Super_Slam"]), # GB 1 - mill
		(flags["forest"] and flags["Lanky"] and flags["Lanky_Gun"] and (flags["Lanky_Move"] or (flags["Diddy"] and flags["Diddy_Barrel"])) and flags["Super_Slam"] and flags["Forest_Top_Mushroom"]), # GB 2 - Top Mushroom 1
		(flags["forest"] and flags["Lanky"] and (flags["Lanky_Move"] or (flags["Diddy"] and flags["Diddy_Barrel"])) and flags["Super_Slam"] and flags["Forest_Top_Mushroom"]), # GB 3 - Top Mushroom 2
		(flags["forest"] and flags["Lanky"] and flags["Lanky_Music"] and flags["Lanky_Barrel"] and flags["Lanky_Gun"]), # GB 4 - Rabbit Race
		(flags["forest"] and flags["Lanky"]), # Banana Medal
		# Tiny
		(flags["forest"] and flags["Tiny"] and flags["Super_Slam"]), # GB 1 - mushroom
		(flags["forest"] and flags["Tiny"] and flags["Tiny_Barrel"] and flags["Tiny_Music"] and flags["Lanky"] and flags["Lanky_Gun"]), # GB 2 - stump
		(flags["forest"] and flags["Tiny"] and flags["Chunky"] and flags["Chunky_Gun"] and flags["Tiny_Barrel"] and flags["Tiny_Music"] and flags["Tiny_Gun"]), # GB 3 - beanstalk
		(flags["forest"] and flags["Tiny"] and flags["Tiny_Gun"] and flags["Tiny_Barrel"] and flags["Chunky"] and flags["Chunky_Move"]), # GB 4 - mill spider
		(flags["forest"] and flags["Tiny"]), # Banana Medal
		# Chunky
		(flags["forest"] and flags["Chunky"] and flags["Chunky_Move"] and flags["Chunky_Music"] and flags["Barrel_Throw"]), # GB 1 - mill barrels
		(flags["forest"] and flags["Chunky"] and flags["Super_Slam"]), # GB 2 - mine cart
		(flags["forest"] and flags["Chunky"] and flags["Chunky_Gun"] and flags["Chunky_Barrel"] and flags["Tiny"] and flags["Tiny_Gun"]), # GB 3 - apple
		(flags["forest"] and flags["Chunky"] and flags["Super_Slam"] and flags["Chunky_Gun"] and flags["Forest_Top_Mushroom"]), # GB 4 - top mushroom
		(flags["forest"] and flags["Chunky"]), # Banana Medal
		# Kasplat
		(flags["forest"] and flags["Forest_Night"]), # DK thorn area
		(flags["forest"]), # Diddy mushroom inside
		(flags["forest"] and flags["Lanky"] and flags["Lanky_Gun"]), # Lanky owl tree
		(flags["forest"]), # Tiny mushroom platforms
		(flags["forest"] and (flags["Diddy"] and flags["Diddy_Barrel"]) or (flags["Forest_Top_Mushroom"] and flags["Forest_Night"])), # Chunky mushroom night

		# Misc Checks (Currently Vanilla Location Logic)
		# Cranky
		(flags["forest"]),
		# Funky
		(flags["forest"] and flags["Tiny"] and flags["Tiny_Gun"] and flags["Chunky"] and flags["Chunky_Gun"]),
		# Candy
		false,
		# Snide
		(flags["forest"] and flags["Forest_Night"]),
		# Battlepad
		(flags["forest"] and (flags["Forest_Night"] and flags["Forest_Top_Mushroom"]) or (flags["Diddy"] and flags["Diddy_Barrel"])), 
		# Boss (Battlepad 2)
		(flags["forest"]), 
		# Rareware / Nintendo Coin
		false, 
		]
	
	check_dict["Crystal Caves"] = [
		# DK
		(flags["caves"] and flags["DK"] and flags["DK_Pad"]), # GB 1 - Pad
		(flags["caves"] and flags["DK"] and flags["Caves_Igloo"] and flags["DK_Music"] and flags["DK_Barrel"]), # GB 2 - Igloo
		(flags["caves"] and flags["DK"] and flags["DK_Music"] and flags["DK_Gun"]), # GB 3 - Main Lodge
		(flags["caves"] and flags["DK"] and flags["DK_Music"]), # GB 4 - Secondary Lodge
		(flags["caves"] and flags["DK"]), # Banana Medal
		# Diddy
		(flags["caves"] and flags["Diddy"] and flags["Caves_Igloo"] and flags["Diddy_Music"] and flags["Barrel_Throw"]), # GB 1 - igloo
		(flags["caves"] and flags["Diddy"] and flags["Diddy_Barrel"]), # GB 2 - waterfall
		(flags["caves"] and flags["Diddy"] and flags["Diddy_Music"] and flags["Orange"]), # GB 3 - Main Lodge
		(flags["caves"] and flags["Diddy"] and flags["Diddy_Music"] and flags["Diddy_Pad"] and flags["Diddy_Barrel"]), # GB 4
		(flags["caves"] and flags["Diddy"]), # Banana Medal
		# Lanky
		(flags["caves"] and flags["Lanky"] and flags["Caves_Igloo"] and flags["Lanky_Music"] and flags["Lanky_Pad"]), # GB 1 - igloo
		(flags["caves"] and flags["Lanky"] and flags["Super_Slam"]), # GB 2 - ice castle
		(flags["caves"] and flags["Lanky"] and flags["Super_Slam"] and flags["Lanky_Pad"]), # GB 3 - bug race
		(flags["caves"] and flags["Lanky"] and flags["Lanky_Pad"] and flags["Lanky_Barrel"] and flags["Lanky_Music"]), # GB 4 - Main Lodge
		(flags["caves"] and flags["Lanky"]), # Banana Medal
		# Tiny
		(flags["caves"] and flags["Tiny"] and flags["Tiny_Music"] and flags["Orange"]), # GB 1 - Main lodge
		(flags["caves"] and flags["Tiny"] and flags["Caves_Igloo"] and flags["Tiny_Music"]), # GB 2 - igloo
		(flags["caves"] and flags["Tiny"] and flags["Tiny_Barrel"]), # GB 3 - tiny area
		(flags["caves"] and flags["Tiny"] and flags["Tiny_Barrel"] and flags["Tiny_Move"] and flags["Tiny_Pad"]), # GB 4 - monkeyport
		(flags["caves"] and flags["Tiny"]), # Banana Medal
		# Chunky
		(flags["caves"] and flags["Chunky"] and flags["Chunky_Pad"] and flags["Chunky_Move"]), # GB 1 - pad
		(flags["caves"] and flags["Chunky_Move"] and flags["Chunky_Barrel"] and flags["Barrel_Throw"]), # GB 2 - boulder
		(flags["caves"] and flags["Chunky"] and flags["Chunky_Music"]), # GB 3 - main lodge
		(flags["caves"] and flags["Chunky"] and flags["Caves_Igloo"] and flags["Chunky_Music"]), # GB 4 - igloo
		(flags["caves"] and flags["Chunky"]), # Banana Medal
		# Kasplat
		flags["caves"], # DK ice castle
		(flags["caves"] and flags["Tiny"] and flags["Tiny_Barrel"] and flags["Tiny_Move"]), # Diddy tiny area
		(flags["caves"] and (flags["Diddy"] and flags["Diddy_Barrel"]) or (flags["Lanky_Pad"] and flags["Lanky"])), # Lanky tall pillar
		flags["caves"], # Tiny lodges
		flags["caves"], # Chunky igloo

		# Misc Checks (Currently Vanilla Location Logic)
		# Cranky
		flags["caves"],
		# Funky
		flags["caves"],
		# Candy
		flags["caves"],
		# Snide
		(flags["caves"] and flags["Chunky"] and flags["Chunky_Move"]),
		# Battlepad
		(flags["caves"] and flags["DK"] and flags["DK_Music"]), 
		# Boss (Battlepad 2)
		true, 
		# Rareware / Nintendo Coin
		false, 
		]
	
	check_dict["Creepy Castle"] = [
		# DK
		(flags["castle"] and flags["DK"] and flags["DK_Pad"]  and flags["DK_Gun"] and flags["Sniper"]), # GB 1 - tree pad
		(flags["castle"] and flags["DK"] and flags["DK_Move"] and flags["DK_Gun"]), # GB 2 - Dungeon Mine Cart Race
		(flags["castle"] and flags["DK"] and flags["Super_Duper_Slam"]), # GB 3 - Tunnel Puzzle
		(flags["castle"] and flags["DK"] and flags["DK_Barrel"] and flags["Super_Duper_Slam"]), # GB 4 - Library
		(flags["castle"] and flags["DK"]), # Banana Medal
		# Diddy
		(flags["castle"] and flags["Diddy"] and flags["Diddy_Gun"] and flags["Diddy_Move"]), # GB 1 - Dungeon Puzzle
		(flags["castle"] and flags["Diddy"] and flags["Diddy_Gun"] and flags["Super_Duper_Slam"] and flags["Sniper"] and flags["Vine"]), # GB 2 - Tunnel Puzzle
		(flags["castle"] and flags["Diddy"] and flags["Diddy_Barrel"] and flags["Super_Duper_Slam"]), # GB 3 - Ballroom
		(flags["castle"] and flags["Diddy"] and flags["Diddy_Barrel"]), # GB 4 - Top Castle
		(flags["castle"] and flags["Diddy"]), # Banana Medal
		# Lanky
		(flags["castle"] and flags["Lanky"] and flags["Lanky_Gun"] and flags["Lanky_Barrel"] and flags["Lanky_Music"] and flags["Vine"]), # GB 1 - dungeon
		(flags["castle"] and flags["Lanky"] and flags["Lanky_Pad"] and flags["Lanky_Music"] and flags["Lanky_Pad"] and flags["Super_Duper_Slam"]), # GB 2 - Tunnel
		(flags["castle"] and flags["Lanky"] and flags["Lanky_Barrel"] and flags["Super_Duper_Slam"]), # GB 3 - Greenhouse
		(flags["castle"] and flags["Lanky"] and flags["Lanky_Gun"] and flags["Super_Duper_Slam"] and flags["Sniper"] and flags["Lanky_Pad"]), # GB 4 - Top Tower
		(flags["castle"] and flags["Lanky"]), # Banana Medal
		# Tiny
		(flags["castle"] and flags["Tiny"] and flags["Tiny_Gun"] and flags["Tiny_Move"] and flags["Super_Duper_Slam"]), # GB 1 - dungeon
		(flags["castle"] and flags["Tiny"] and flags["Tiny_Move"]), # GB 2 - tunnel
		(flags["castle"] and flags["Tiny"] and flags["Tiny_Barrel"] and flags["Tiny_Gun"]), # GB 3 - greenhouse
		(flags["castle"] and flags["Tiny"] and flags["Tiny_Pad"] and flags["Tiny_Barrel"] and flags["Diddy"] and flags["Super_Duper_Slam"]), # GB 4 - ballroom race
		(flags["castle"] and flags["Tiny"]), # Banana Medal
		# Chunky
		(flags["castle"] and flags["Chunky"] and flags["Chunky_Gun"] and flags["Chunky_Move"] and flags["Sniper"] and flags["DK"] and flags["DK_Pad"]), # GB 1 tree gun
		(flags["castle"] and flags["Chunky"] and flags["Chunky_Gun"] and flags["Chunky_Move"]), # GB 2 dungeon
		(flags["castle"] and flags["Chunky"] and flags["Castle_Chunky_Greenhouse"]), # GB 3 greenhouse
		(flags["castle"] and flags["Chunky"] and flags["Chunky_Move"] and flags["Super_Duper_Slam"] and flags["Barrel_Throw"]), # GB 4 museum
		(flags["castle"] and flags["Chunky"]), # Banana Medal
		# Kasplat
		(flags["castle"] and flags["DK"] and flags["DK_Pad"] and flags["DK_Gun"]), # DK
		flags["castle"], # Diddy
		flags["castle"], # Lanky
		flags["castle"], # Tiny
		flags["castle"], # Chunky

		# Misc Checks (Currently Vanilla Location Logic)
		# Cranky
		flags["castle"],
		# Funky
		flags["castle"],
		# Candy
		flags["castle"],
		# Snide
		flags["castle"],
		# Battlepad
		(flags["castle"] and flags["Lanky"] and flags["Super_Duper_Slam"]), 
		# Boss (Battlepad 2)
		flags["castle"], 
		# Rareware / Nintendo Coin
		false, 
		]
	return check_dict


func special_flags_update():
	flags["Aztec_Main"] = flags["aztec"] and flags["Diddy"] and flags["Diddy_Music"] and (flags["Vine"] or flags["Diddy_Barrel"])
	
	flags["Aztec_Tower"] = flags["aztec"] and flags["Aztec_Main"] and  (flags["Remove_High_Requirments"]) or (flags["Diddy"] and flags["Diddy_Gun"])
	
	flags["Factory_Power"] = flags["factory"] and (flags["Remove_High_Requirments"] or (flags["DK"] and flags["DK_Move"]and flags["DK_Gun"]))
	
	flags["Forest_Night"] = (
		(flags["Diddy"] and flags["Diddy_Gun"])
		or (flags["DK"] and flags["DK_Gun"]) 
		or (flags["Lanky"] and flags["Lanky_Gun"]) 
		or (flags["Tiny"] and flags["Tiny_Gun"]) 
		or (flags["Chunky"] and flags["Chunky_Gun"]))
	
	flags["Galleon_Water"] = (flags["galleon"] and flags["Lanky"] and flags["Swim"] and flags["DK"] and flags["DK_Gun"])
	
	flags["Galleon_Ship"] = (flags["galleon"] and 
		(flags["Remove_High_Requirments"] 
		or (flags["Galleon_Water"] and flags["DK"] and flags["DK_Move"])))
	
	flags["Caves_Igloo"] = (flags["caves"] and (flags["Remove_High_Requirments"] or (flags["Diddy"] and flags["Diddy_Barrel"])))
		
	flags["Japes_Alcove"] = (flags["japes"] and (flags["Diddy"] and flags["Diddy_Gun"]))
	
	flags["Aztec_Ice_Melt"] = (flags["Remove_High_Requirments"] or (flags["aztec"] and (flags["Diddy"] and flags["Diddy_Gun"])))
	
	flags["Main_Galleon"] = (flags["galleon"] and (flags["Diddy"] and flags["Diddy_Gun"]))
	
	flags["Forest_Top_Mushroom"] = (flags["forest"] 
	and (flags["Vine"] or (flags["Diddy"] and flags["Diddy_Barrel"]) or flags["DK"]))
	
	flags["Llama_Temple"] = (flags["Aztec_Main"]
	and ((flags["DK"] and flags["DK_Pad"] and flags["DK_Gun"])
	or (flags["Diddy_Gun"])
	or (flags["Lanky"] and flags["Lanky_Gun"])
	or (flags["Tiny"] and flags["Tiny_Gun"])
	or (flags["Chunky"] and flags["Chunky_Gun"])))
	
#	flags["Isles_Snide_Diddy"] = (flags["Diddy"] and (flags["Activate_Bananaports_Isles"] or (flags["Vine"] and flags["key_2"])) and flags["Diddy_Pad"])
	
	flags["Factory_Lanky_Pad"] = (flags["factory"] and flags["Lanky"] and flags["Lanky_Pad"])
	
	flags["Isles_Aztec_Lobby"] = (flags["aztec"] or flags["Open_Lobbies"]) and (flags["Tiny"] and flags["Diddy"] and flags["Diddy_Move"] and flags["Tiny_Move"])
	
	flags["Castle_Chunky_Greenhouse"] = (flags["castle"] and flags["Chunky"] and flags["Chunky_Move"] and flags["Chunky_Pad"]
	and (flags["Chunky_Gun"] or flags["Chunky_Music"]))
	
	flags["Helm_Acces"] = ((flags["Open_Lobbies"] or (flags["key_6"] and flags["key_7"])) and (flags["key_2"] or (flags["Tiny"] and flags["Tiny_Pad"])))
func _on_DK_Button_pressed():
	flip("DK")


func _on_Diddy_Button_pressed():
	flip("Diddy")


func _on_Lanky_Button_pressed():
	flip("Lanky")


func _on_Tiny_Button_pressed():
	flip("Tiny")


func _on_Chunky_Button_pressed():
	flip("Chunky")


func _on_DK_Pad_Button_pressed():
	flip("DK_Pad")


func _on_Diddy_Pad_Button_pressed():
	flip("Diddy_Pad")


func _on_Lanky_Pad_Button_pressed():
	flip("Lanky_Pad")


func _on_Tiny_Pad_Button_pressed():
	flip("Tiny_Pad")


func _on_Chunky_Pad_Button_pressed():
	flip("Chunky_Pad")


func _on_DK_Gun_Button_pressed():
	flip("DK_Gun")


func _on_Diddy_Gun_Button_pressed():
	flip("Diddy_Gun")


func _on_Lanky_Gun_Button_pressed():
	flip("Lanky_Gun")


func _on_Tiny_Gun_Button_pressed():
	flip("Tiny_Gun")


func _on_Chunky_Gun_Button_pressed():
	flip("Chunky_Gun")


func _on_DK_Instrument_Button_pressed():
	flip("DK_Music")


func _on_Diddy_Instrument_Button_pressed():
	flip("Diddy_Music")


func _on_Lanky_Instrument_Button_pressed():
	flip("Lanky_Music")


func _on_Tiny_Instrument_Button_pressed():
	flip("Tiny_Music")



func _on_Chunky_Instrument_Button_pressed():
	flip("Chunky_Music")


func _on_DK_Move_Button_pressed():
	flip("DK_Move")


func _on_Diddy_Move_Button_pressed():
	flip("Diddy_Move")


func _on_Lanky_Move_Button_pressed():
	flip("Lanky_Move")


func _on_Tiny_Move_Button_pressed():
	flip("Tiny_Move")


func _on_Chunky_Move_Button_pressed():
	flip("Chunky_Move")


func _on_DK_Barrel_Button_pressed():
	flip("DK_Barrel")


func _on_Diddy_Barrel_Button_pressed():
	flip("Diddy_Barrel")


func _on_Lanky_Barrel_Button_pressed():
	flip("Lanky_Barrel")


func _on_Tiny_Barrel_Button_pressed():
	flip("Tiny_Barrel")


func _on_Chunky_Barrel_Button_pressed():
	flip("Chunky_Barrel")


func _on_Swim_Button_pressed():
	flip("Swim")


func _on_Vine_Button_pressed():
	flip("Vine")


func _on_Sniper_Lens_Button_pressed():
	flip("Sniper")


func _on_Super_Slam_Button_pressed():
	flip("Super_Slam")


func _on_Super_Duper_Slam_Button_pressed():
	flip("Super_Duper_Slam")


func _on_Barrel_Throw_Button_pressed():
	flip("Barrel_Throw")

func _on_Orange_Button_pressed():
	flip("Orange")

func _on_JJ_Button_pressed():
	flip("japes")


func _on_AA_Button_pressed():
	flip("aztec")


func _on_Factory_Button_pressed():
	flip("factory")


func _on_GG_Button_pressed():
	flip("galleon")


func _on_Forest_Button_pressed():
	flip("forest")


func _on_Caves_Button_pressed():
	flip("caves")


func _on_Castle_Button_pressed():
	flip("castle")


func _on_Japes_Kong_Button_pressed():
	flip("Japes_Kong")


func _on_Key_2_Button_pressed():
	flip("key_2")


func _on_Key_6_Button_pressed():
	flip("key_6")


func _on_Key_7_Button_pressed():
	flip("key_7")

func _on_Bananaport_pressed():
	flip("Activate_Bananaports_Isles")

func _on_Shop_Location_pressed():
	flip("Shuffle_Shop_Locations") # Replace with function body.

func _on_Kasplats_pressed():
	flip("Shuffle_Kasplats") # Replace with function body.

func _on_Training_pressed():
	flip("Training_Barrels") # Replace with function body.

func _on_Fairy_Island_pressed():
	flip("Banana_Fairy_Isle") # Replace with function body.

func _on_Bananaports2_pressed():
	flip("Shuffle_Bananaports") # Replace with function body.

func _on_Lobbies_pressed():
	flip("Open_Lobbies") # Replace with function body.

func _on_Levels_pressed():
	flip("Open_Levels") # Replace with function body.

func _on_High_Requirments_pressed():
	flip("Remove_High_Requirments") # Replace with function body.
