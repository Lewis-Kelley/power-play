extends Node2D

enum EntityType { ACTOR, OBJECT, OBSTACLE }
export(EntityType) var type = ACTOR