extends CharacterBody2D

var speed = 200
@onready var player = get_parent().get_node('Player')
var hunt = false
var ACCEL = 300
var MAXSPEED = 50


func _physics_process(delta):
	$AnimationPlayer.play("flight")
	
	if hunt == true:
		var direction = (player.global_position - global_position).normalized()
		velocity = velocity.move_toward(direction * MAXSPEED, ACCEL * delta)
		move_and_slide()

func _on_player_detection_area_entered(_area):
	hunt = true

func _on_player_detection_area_exited(_area):
	hunt = false
