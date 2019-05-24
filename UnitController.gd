extends Node

export(NodePath) var unit_path
var unit

export(NodePath) var actor_path
var actor

func _ready():
    unit = get_node(unit_path)
    actor = get_node(actor_path)

    unit.connect('unit_activated', self, 'on_unit_activated')
    unit.connect('unit_deactivated', self, 'on_unit_deactivated')

func _process(delta):
    if not unit.active:
        return
    
    var direction = get_input_direction()
    if direction:
        actor.maybe_move(direction)

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

func on_unit_activated():
    actor.build_fence(unit.get_travel_range())

func on_unit_deactivated():
    actor.destroy_fence()