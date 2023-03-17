extends CharacterBody2D

var speed = 100
@onready var player = get_tree().get_node("player")
var hunt = false
var ACCEL = 300
var MAXSPEED = 50


func _physics_process(delta):
	$AnimationPlayer.play("flight")
	
	if hunt == true:
		var direction = (player.position - global_position).normalized()
		velocity = velocity.move_toward(direction * MAXSPEED, ACCEL * delta)
	move_and_slide()

func _on_player_detection_area_entered(area):
	hunt = true

func _on_player_detection_area_exited(area):
	hunt = false
