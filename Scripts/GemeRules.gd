extends Node2D

var lives = 5
var coins = 0

func _ready():
	print("Add lives")
	get_tree().call_group("GUI", "add_lives", lives)
	

func hurt():
	$Player.hurt()
	print("HURT")
	lives -= 1
	get_tree().call_group("GUI", "update_lives", lives)
	if lives < 1:
		end_geme()
		

func coin_up():
	coins += 1
	get_tree().call_group("GUI", "add_coins", coins)

func end_geme():
	get_tree().change_scene("res://Scenes/GemeOver.tscn")


