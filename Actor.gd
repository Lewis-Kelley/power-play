extends "Entity.gd"

onready var grid = get_parent()

func _ready():
    pass

func _process(delta):
    var direction = get_input_direction()
    if direction:
        var destination = grid.maybe_move_entity(self, direction)
        if destination:
            position = destination

func get_input_direction():
    var direction = Vector2(0, 0)

    if Input.is_action_just_pressed("ui_up"):
        direction.y -= 1
    if Input.is_action_just_pressed("ui_down"):
        direction.y += 1
    if Input.is_action_just_pressed("ui_left"):
        direction.x -= 1
    if Input.is_action_just_pressed("ui_right"):
        direction.x += 1

    if direction != Vector2(0, 0):
        return direction