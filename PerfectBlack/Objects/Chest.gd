extends StaticBody2D

@onready var global = get_node("/root/Globals")

func _ready():
	$AnimationPlayer.play("Closed")

func _on_player_area_entered(_area):
	global.chest()
	$pickup.play()
	$AnimationPlayer.play("pickup")
