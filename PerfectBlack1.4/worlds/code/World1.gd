extends Area2D

@onready var global = get_node("/root/Globals")

func _on_area_entered(_area):
	global.unlit()
	get_tree().change_scene_to_file("res://worlds/world_2.tscn")
