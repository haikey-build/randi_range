extends Node2D

@onready var _label = $Label
@onready var _rect = $Rect

var count = 0
var _id

func set_id(id):
	_id = id
	_rect.modulate = Color(0.6, _id / 21.0, 0.8 - (_id / 32.0), 1)
	_label.text = str(_id)
	position.x = _id * 100 - 1000
	set_bar_height(0)

func set_bar_height(height):
	_rect.scale.y = height * 7000.0
	_rect.position.y = - _rect.scale.y / 2
