extends StaticBody2D

@onready var global = get_node("/root/Globals")
var collected = false

func _ready():
	$AnimationPlayer.play("Closed")

func _on_player_area_entered(_area):
	if collected == false:
		global.chest()
		$pickup.play()
		$AnimationPlayer.play("pickup")
	collected = true
