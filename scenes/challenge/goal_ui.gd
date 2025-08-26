class_name GoalUI
extends Node2D

@export var title: Label
@export var animals_label: Label
@export var discards_label: Label
@export var goal_tooltip: StatsTooltip
@export var score_tooltip: StatsTooltip

func _ready() -> void:
	goal_tooltip.set_sprite(Vector2(4, 0))

func set_challenge_stats_ui(challenge: Challenge):
	goal_tooltip.set_goal_stats(challenge)
	title.text = challenge.name
	animals_label.text = "Animals: " + str(challenge.animal_limit)
	discards_label.text = "Discards: " + str(challenge.discard_limit)

func set_score_tooltip(animals: Array[Animal]):
	for animal in animals:
		score_tooltip.add_animal(animal)

func _on_animal_combo_submit_animal(animals: Array[Animal]) -> void:
	set_score_tooltip(animals)
