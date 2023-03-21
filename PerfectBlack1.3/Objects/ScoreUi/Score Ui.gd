extends CanvasLayer

@onready var global = get_node("/root/Globals")

func _process(_delta):
	$Label.set_text(str("Score: ",global.score))
	$Label.hide()
	if global.started == true:
		$Label.show()
