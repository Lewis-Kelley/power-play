extends Node

var units = []

func _ready():
    units = get_children()

    units[0].activate()

func _process(delta):
    if Input.is_action_just_pressed("ui_accept"):
        activate_next_unit()

func activate_next_unit():
    var head = units[0]
    units[0].deactivate()

    units.remove(0)
    units.append(head)

    units[0].activate()