extends CharacterBody2D

@onready var global = get_node("/root/Globals")

var JUMP_VELOCITY = -300.0
var Speed = 100 #this one is affected by upgrades
var SPEED = 100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facingright = true
var Dashready = true
var upsidedown = false
var dead = false
var dashtime = 0.4

func _ready():
	$Sprite/Trail.hide()

func _physics_process(delta):
	if dead == false:
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
				velocity.y = 0
				$"dash time".start(dashtime)
				$Sprite/Trail.show()
				Dashready = false
		
		if Input.is_action_pressed("end"):
			get_tree().quit()
		
		if !is_on_floor():
			$AnimationPlayer.play("In_air")
		
		if position.y > 448:
			$AnimationPlayer.play("Death")
			dead = true
			SPEED = 0
			$Death.play()
		
		move_and_slide()



func _on_death_finished():
	get_tree().reload_current_scene()

func _on_dash_time_timeout():
	gravity = 980
	SPEED = Speed
	$Cooldown.start()
	$"dash time".stop()
	print("reset")
	$Sprite/Trail.hide()

func _on_cooldown_timeout():
	Dashready = true
	$Player2.play("Dash")
	$Cooldown.stop()
	print("ready")

func _on_fan_area_entered(_area):
	gravity = -500

func _on_fan_area_exited(_area):
	gravity = 980

func _on_death_2_area_entered(_area):
	$AnimationPlayer.play("Death")
	dead = true
	SPEED = 0
	$Death.play()

func _on_chest_area_entered(_area):
	$Player2.play("Plus5")

func _on_coin_area_entered(_area):
	$Player2.play("Plus1")

func _on_spring_area_entered(_area):
	velocity.y = -800

func _on_speed_area_entered(_area):
	$Player2.play("Upgraded")
	Speed += 50

func _on_dash_area_entered(_area):
	$Player2.play("Upgraded")
	dashtime += 0.2

func _on_jump_area_entered(_area):
	$Player2.play("Upgraded")
	JUMP_VELOCITY -= 100
