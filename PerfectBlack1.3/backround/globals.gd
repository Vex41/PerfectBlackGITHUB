extends Node2D

var score = 0
var light = true
var started = false

func coin():
	score += 1
	print(score)

func unlit():
	light = false
func lit():
	light = true

func chest():
	score += 5

func start():
	started = true
