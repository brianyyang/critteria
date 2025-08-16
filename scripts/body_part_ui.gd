class_name BodyPartUI
extends Control

@export var animal_part: AnimalPart
@export var sprite: Sprite2D

const SPRITE_GRID_HEIGHT = 40
const SPRITE_GRID_WIDTH = 17

func _ready() -> void:
	var sprite_xy = animal_part.getSpriteCoordinates()
	sprite.region_rect.position.x = sprite_xy.x * SPRITE_GRID_WIDTH
	sprite.region_rect.position.y = sprite_xy.y * SPRITE_GRID_HEIGHT
