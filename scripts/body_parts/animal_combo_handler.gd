class_name AnimalComboHander
extends Node

signal submit_animal(animals: Array[Animal])
signal discard_cards(cards: Array[BodyPartUI])

@export var body_drop_areas: Array[BodyDropArea]
@export var stats_tooltip: StatsTooltip

func on_submit_animal() -> void:
	if !has_full_animal():
		return
	submit_animal.emit(stats_tooltip.animals)
	stats_tooltip.animals.clear()
	stats_tooltip.set_stats()
	discard_cards.emit(body_drop_areas.map(func(area: BodyDropArea): return area.card_in_area))
	for drop_area in body_drop_areas:
		drop_area.occupied = false
		drop_area.card_in_area.queue_free()

func has_full_animal() -> bool:
	return body_drop_areas.all(func(area: BodyDropArea): area.occupied)
