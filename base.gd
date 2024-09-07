extends Node2D

var _bar_scene = preload("res://bar.tscn")
var _bars = []
var _total = 0.0

@onready var _rng = RandomNumberGenerator.new()
@onready var _stat_panel = $StatisticPanel
@onready var _lines_panel = $LinesPanel

func _ready():
	for i in range(21):
		var bar = _bar_scene.instantiate()
		_bars.push_back(bar)
		add_child(bar)
		bar.set_id(i)

func _physics_process(delta):
	var new_num = _rng.randi_range(0, 20)
	_bars[new_num].count += 1
	_total += 1
	_rebalance()

func _rebalance():
	var lowest = _total
	var highest = 0
	var bar_vals = []

	for i in range(21):
		var bar_count = _bars[i].count
		_bars[i].set_bar_height(bar_count / _total)
		if bar_count > highest:
			highest = bar_count
		if bar_count < lowest:
			lowest = bar_count

	_stat_panel.update(_total, highest / _total, lowest / _total)
	_lines_panel.set_new_vals([highest / _total, lowest / _total])

func _input(event):
	if event is InputEventKey and event.pressed and event.scancode == KEY_ESCAPE:
		get_tree().quit()
