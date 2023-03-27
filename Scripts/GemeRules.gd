extends Node2D

var lives = 3

func _ready():
	pass


func hurt():
	$Player.hurt()
	print("HURT")
	lives -= 1
	if lives < 1:
		end_geme()


func end_geme():
	get_tree().change_scene("res://Scenes/GemeOver.tscn")
