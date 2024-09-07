extends Line2D

var values: Array = []
var _id

func set_id(id):
	_id = id

func _ready():
	set_process(true)

func _process(_delta):
	update_line()

func set_new_val(val: float):
	values.append(val)
	update_line()

func update_line():
	clear_points()
	var chart_width = get_viewport_rect().size.x * 1.3
	var chart_height = get_viewport_rect().size.y / 1.5
	var point_width = chart_width / (values.size() - 1) if values.size() > 1 else chart_width

	for i in range(values.size()):
		var x = i * point_width
		var y = chart_height - (values[i] * chart_height) * 5
		add_point(Vector2(x, y))

	if values.size() == 1:
		add_point(Vector2(chart_width, points[0].y))

func _on_viewport_size_changed():
	update_line()