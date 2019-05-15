extends Node

var units = []

func _ready():
    units = get_children()

    units.sort_custom(UnitSpeedSorter, "sort")

    units[0].activate()

class UnitSpeedSorter:
    static func sort(unit_a, unit_b):
        return unit_a.speed < unit_b.speed

func _process(delta):
    if Input.is_action_just_pressed("ui_accept"):
        activate_next_unit()

func activate_next_unit():
    var head = units[0]
    units[0].deactivate()

    units.remove(0)
    units.append(head)

    units[0].activate()