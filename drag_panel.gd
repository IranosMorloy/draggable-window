extends Control

var can_drag = false
var drag_offset = Vector2()
onready var parent = get_parent()

func _ready():
	connect("gui_input", self, "on_gui_input")
	
func on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			can_drag = true
			drag_offset = parent.rect_position - get_global_mouse_position()
		elif event.button_index == BUTTON_LEFT and event.pressed == false:
			can_drag = false
		set_process(can_drag)

func _process(_delta):
	if can_drag:
		parent.rect_position = get_global_mouse_position() + drag_offset
