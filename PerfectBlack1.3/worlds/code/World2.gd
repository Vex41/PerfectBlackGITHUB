extends Area2D

func _on_area_entered(_area):
	get_tree().change_scene_to_file("res://worlds/world_3.tscn")
