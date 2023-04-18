extends CanvasLayer


func _ready():
	pass


func add_lives(lives_count):
	while lives_count > $Control/HeartsContainer.get_child_count():
		print(lives_count)
		$Control/HeartsContainer.add_child(load("res://Scenes/heart1.tscn").instance())

func update_lives(lives_count):
	$Control/HeartsContainer.remove_child($Control/HeartsContainer.get_children().pop_back())

func remove_lives(lives_count):
	pass


func add_coins(coins_amount):
	$Control/HeartsContainer2/Label.text = str(coins_amount)
	
