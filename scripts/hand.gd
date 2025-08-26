class_name Hand
extends HBoxContainer

@export var deck: CardPile
@export var body_part_ui_scene: PackedScene

func _ready() -> void:
	deck.shuffle()
	var hand: Array[BodyPartUI] = []
	for i in range(6):
		var rand_animal_part = deck.draw_card()
		var new_card: BodyPartUI = body_part_ui_scene.instantiate()
		new_card.animal_part = rand_animal_part
		hand.append(new_card)

	for body_part in hand:
		add_child(body_part)
		body_part.reparent_requested.connect(_on_body_part_ui_reparent_requested)

func _on_body_part_ui_reparent_requested(child: BodyPartUI) -> void:
	child.reparent(self)
