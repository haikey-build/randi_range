extends Node2D

var _lines = []
@onready var _chart_line_scene = preload("res://simulation/charts/chart_line.tscn")

func set_new_vals(bar_vals):
	for i in range(_lines.size()):
		_lines[i].set_new_val(bar_vals[i])


func _ready():
	for i in range(2):
		var line = _chart_line_scene.instantiate()
		_lines.push_back(line)
		add_child(line)
		line.set_id(i)
