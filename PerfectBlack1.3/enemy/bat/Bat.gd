extends CharacterBody2D

var hunt = false
var MAXSPEED = 50
var ACCEL = 300

@onready var player = get_node("player")

func _physics_process(delta):
	$AnimationPlayer.play("flight")
	
	if hunt == true:
		var direction = (global_position - player.global_position)
		velocity = velocity.move_toward(direction * MAXSPEED, ACCEL * delta)
	move_and_slide()

func _on_player_detection_area_entered(_area):
	hunt = true

func _on_player_detection_area_exited(_area):
	hunt = false
