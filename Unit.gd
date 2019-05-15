extends Node

var active = false
var speed

func _ready():
    randomize()
    speed = randi() % 100

func activate():
    active = true

func deactivate():
    active = false