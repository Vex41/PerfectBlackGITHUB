extends StaticBody2D

@onready var global = get_node("/root/Globals")

func _ready():
	$AnimationPlayer.play("spin")

func _on_detection_area_entered(area):
	global.coin()
	$AnimationPlayer.play("pickup")
	$AudioStreamPlayer2D.play()

func _on_audio_stream_player_2d_finished():
	queue_free()
