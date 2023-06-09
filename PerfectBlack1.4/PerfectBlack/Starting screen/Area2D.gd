extends Area2D

var mouse = false
@onready var global = get_node("/root/Globals")

func _physics_process(_delta):
	
	$AnimationPlayer.play("button")
	
	if mouse == true:	
		if Input.is_action_pressed("click"):
			global.start()
			$AnimationPlayer2.play("Fade")
			$click.play()



func _on_mouse_shape_entered(_shape_idx):
	mouse = true
	print("mouse")

func _on_mouse_shape_exited(_shape_idx):
	mouse = false

func _on_click_finished():
	get_tree().change_scene_to_file("res://worlds/world_1.tscn")
