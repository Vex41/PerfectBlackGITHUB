extends AudioStreamPlayer2D

func _on_finished():
	self.play()

func _process(_delta):
	if Input.is_action_pressed("amongus"):
		self.stop()
		$Sus.play()
