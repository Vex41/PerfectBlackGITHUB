extends Node2D

var hide = false
@onready var global = get_node("/root/Globals")

func _physics_process(_delta):
	if Input.is_action_pressed("Controls"):
		if hide == false:
			hide = true
		if hide == true:
			hide = false
	
	if hide == false:
		$Sprite2D.hide()
	else:
		$Sprite2D.show()
