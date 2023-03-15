extends CharacterBody2D

const JUMP_VELOCITY = -300.0

var SPEED = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facingright = true
var Dashready = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if gravity == 980:
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	if gravity == 0:
		if Input.is_action_pressed("up"):
			velocity.y = -SPEED
		if Input.is_action_pressed("down"):
			velocity.y = SPEED
	
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if Input.is_action_pressed("left"):
		$AnimationPlayer.play("walk")
		$Sprite.scale.x = -1
	if Input.is_action_pressed("right"):
		$AnimationPlayer.play("walk")
		$Sprite.scale.x = 1
	
	if !Input.is_action_pressed("left") and !Input.is_action_pressed("right"):
		$AnimationPlayer.play("idle")
	
	if Input.is_action_pressed("dash"):
		if Dashready == true:
			SPEED = 300
			gravity = 0
			$"dash time".start()
			Dashready = false
	
	
	if !is_on_floor():
		$AnimationPlayer.play("In_air")
	
	move_and_slide()








#Misc connections to children

func _on_visible_on_screen_notifier_2d_screen_exited():
	SPEED = 0
	$Death.play()

func _on_death_finished():
	get_tree().reload_current_scene()

func _on_dash_time_timeout():
	gravity = 980
	SPEED = 100
	$Cooldown.start()
	$"dash time".stop()
	print("reset")

func _on_cooldown_timeout():
	Dashready = true
	$Cooldown.stop()
	print("ready")
