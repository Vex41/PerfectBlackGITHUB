extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facingright = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
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
	
	if !is_on_floor():
		$AnimationPlayer.play("In_air")
	move_and_slide()








#Misc connections to children

func _on_visible_on_screen_notifier_2d_screen_exited():
	$Death.play()

func _on_death_finished():
	get_tree().reload_current_scene()
