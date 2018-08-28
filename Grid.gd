extends TileMap

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