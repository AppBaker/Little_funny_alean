extends Control


func _ready():
	pass 


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_end_pressed():
	get_tree().quit()

