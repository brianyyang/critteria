class_name StatsTooltip
extends Node2D

const CARD_SPRITE_WIDTH = 44
const CARD_SPRITE_HEIGHT = 28

@export var card_sprite: Sprite2D
@export var speed_text: Label
@export var power_text: Label
@export var endurance_text: Label
@export var swim_text: Label

var animals: Array[Animal] = []

func set_sprite(coordinates: Vector2) -> void:
	card_sprite.region_rect.position.x = coordinates.x * CARD_SPRITE_WIDTH
	card_sprite.region_rect.position.y = coordinates.y * CARD_SPRITE_HEIGHT

func add_animal(animal: Animal) -> void:
	animals.append(animal)
	set_stats()

func remove_animal(animal: Animal) -> void:
	animals.erase(animal)
	set_stats()

func set_stats() -> void:
	format_text(animals.reduce(func(sum, animal): return sum + animal.speed, 0), speed_text)
	format_text(animals.reduce(func(sum, animal): return sum + animal.power, 0), power_text)
	format_text(animals.reduce(func(sum, animal): return sum + animal.endurance, 0), endurance_text)
	format_text(animals.reduce(func(sum, animal): return sum + animal.swim, 0), swim_text)

func format_text(stat_value: int, label: Label) -> void:
	var modifier = " "
	var color = Color(0.9, 0.9, 0.9)
	if stat_value > 0:
		modifier = "+"
		color = Color("#03720c")
	elif stat_value < 0:
		modifier = ""
		color = Color("#a40a0a")
	var formatted = modifier + str(stat_value)
	label.text = formatted
	label.add_theme_color_override("font_color", color)
