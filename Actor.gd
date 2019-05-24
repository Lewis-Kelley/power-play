extends "Entity.gd"

onready var grid = get_parent()

func maybe_move(direction):
    var destination = grid.maybe_move_entity(self, direction)
    if destination:
        position = destination

func build_fence(travel_range):
    grid.build_fence(position, travel_range)

func destroy_fence():
    grid.destroy_fence()