extends Node

signal unit_activated
signal unit_deactivated

var active = false
var speed

func _ready():
    randomize()
    speed = randi() % 100

func activate():
    active = true

    emit_signal('unit_activated')

func deactivate():
    active = false

    emit_signal('unit_deactivated')

func get_travel_range():
    # We add 2 to make sure the unit can always travel at least one tile
    return floor(speed / 20.0) + 2