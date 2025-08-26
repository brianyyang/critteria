class_name ChallengeManager
extends Node

@export var challenge: Challenge
@export var goal_ui: GoalUI

func _ready() -> void:
	challenge.speed = randi_range(3,10)
	challenge.power = randi_range(3,10)
	challenge.endurance = randi_range(3,10)
	challenge.swim = randi_range(3,10)
	goal_ui.set_challenge_stats_ui(challenge)

func _on_submit_pressed() -> void:
	challenge.animal_limit -= 1
	goal_ui.set_challenge_stats_ui(challenge)
