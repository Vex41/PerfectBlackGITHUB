extends StaticBody2D

func _on_player_area_entered(_area):
	$AnimationPlayer.play("Spring")
