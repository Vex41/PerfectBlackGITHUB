extends TileMap

var selected = false

func _on_speed_area_entered(_area):
	selected = true

func _on_jumps_area_entered(_area):
	selected = true

func _on_dash_area_entered(_area):
	selected = true

func _process(_delta):
	if selected == true:
		$Dash.hide()
		$Jump.hide()
		$Speed.hide()
