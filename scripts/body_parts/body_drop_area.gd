class_name BodyDropArea
extends Area2D

@export var hovered_sprite: Sprite2D
@export var stats_tooltip: StatsTooltip

var occupied := false
var card_in_area: BodyPartUI

func _on_body_part_entered(area: Area2D) -> void:
	hovered_sprite.visible = true
	if occupied and card_in_area:
		card_in_area.card_sprite.modulate = Color(1.2, 1.2, 1.2)

func _on_body_part_exited(area: Area2D) -> void:
	hovered_sprite.visible = false
	if occupied and card_in_area:
		card_in_area.card_sprite.modulate = Color(1, 1, 1)

func add_animal_stats(animal: Animal) -> void:
	stats_tooltip.add_animal(animal)

func remove_animal_stats(animal: Animal) -> void:
	stats_tooltip.remove_animal(animal)
