extends Area2D

@onready var popup_label: Label = $"../PopupLabel"


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Global.has_axe:
			get_tree().change_scene_to_file("res://breakwood.tscn")
		else:
			show_popup("ประตูนี้ต้องใช้ขวานจึงจะเปิดได้!")

func show_popup(text: String):
	if popup_label:
		popup_label.text = text
		popup_label.add_theme_color_override("font_color", Color.RED)
		popup_label.visible = true
		await get_tree().create_timer(2.0).timeout
		popup_label.visible = false
