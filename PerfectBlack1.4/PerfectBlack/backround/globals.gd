extends Node2D

var score = 0
var light = true
var started = false

var speed = 100
var Dashtime = 0.4
var jumpvelocity = -300

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


func SPEED():
	speed += 50
	print(speed)
func dashtime():
	Dashtime += 0.2
	print(Dashtime)
func jump():
	jumpvelocity -= 100
	print(jumpvelocity)
