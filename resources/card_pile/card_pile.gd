class_name CardPile
extends Resource

signal card_pile_size_changed(new_pile_size: int)

@export var cards: Array[AnimalPart] = []

func is_empty() -> bool:
	return cards.is_empty()

func draw_card() -> AnimalPart:
	var card = cards.pop_front()
	card_pile_size_changed.emit(cards.size())
	return card

func add_card(card: AnimalPart) -> void:
	cards.append(card)
	card_pile_size_changed.emit(cards.size())

func shuffle() -> void:
	cards.shuffle()

func clear() -> void:
	cards.clear()
	card_pile_size_changed.emit(0)

func _to_string() -> String:
	var _card_strings: PackedStringArray = []
	for i in range(cards.size()):
		_card_strings.append("%s: %s" % [i + 1, cards[i].id])
	return "\n".join(_card_strings)
