extends TileMap

var fence_swap = Dictionary()

func _ready():
    for child in get_children():
        set_cellv(world_to_map(child.position), 0)

func maybe_move_entity(entity, direction):
    var entity_pos = world_to_map(entity.position)
    var dest_pos = entity_pos + direction
    if get_cellv(dest_pos) == -1:
        swap_cellv(entity_pos, dest_pos)
        return map_to_world(dest_pos) + (cell_size / 2)

func swap_cellv(pos1, pos2):
    var swap = get_cellv(pos1)
    set_cellv(pos1, get_cellv(pos2))
    set_cellv(pos2, swap)

func build_fence(origin, travel_range):
    origin = world_to_map(origin)

    var painter = Vector2(travel_range, 0)

    for i in range(0, travel_range):
        var fenceposts = get_fenceposts(origin, painter)

        for fencepost in fenceposts:
            fence_swap[fencepost] = get_cellv(fencepost)

            set_cellv(fencepost, 1)

        painter += Vector2(-1, 1)

func get_fenceposts(origin, painter):
    return [
        Vector2(origin.x - painter.x, origin.y + painter.y),
        Vector2(origin.x + painter.y, origin.y + painter.x),
        Vector2(origin.x + painter.x, origin.y - painter.y),
        Vector2(origin.x - painter.y, origin.y - painter.x)
    ]

func destroy_fence():
    for i in range(0, fence_swap.size()):
        set_cellv(fence_swap.keys()[i], fence_swap.values()[i])

    fence_swap = Dictionary()