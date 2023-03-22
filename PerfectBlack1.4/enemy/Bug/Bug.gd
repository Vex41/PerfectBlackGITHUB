extends CharacterBody2D

var goright = true

func _physics_process(_delta):
	
	$AnimationPlayer.play("Walk")
	
	if goright == true:
		velocity.x = 30
	if goright == false:
		velocity.x = -30
	
	if !$Left.is_colliding() or $WallLeft.is_colliding():
		goright = true
	if !$Right.is_colliding() or $WallRight.is_colliding():
		goright = false
	
	move_and_slide()
