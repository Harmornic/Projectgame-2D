extends Area2D

@export var normal_tex: Texture2D
@export var hover_tex: Texture2D
@export var clicked_tex: Texture2D

@onready var sprite: Sprite2D = $Sprite2D
var is_clicked := false

func _ready() -> void:
	if normal_tex:
		sprite.texture = normal_tex
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	if not is_clicked and hover_tex:
		sprite.texture = hover_tex

func _on_mouse_exited() -> void:
	if not is_clicked and normal_tex:
		sprite.texture = normal_tex

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if not Global.has_clicked_stone:
			show_popup("คุณต้องตรวจสอบก้อนหินก่อน!")
			return

		Global.has_axe = true
		sprite.texture = clicked_tex
		is_clicked = true
		show_popup("คุณเก็บขวานแล้ว!")
		# ไม่ต้องซ่อน `visible = false` ถ้าอยากให้เห็นขวานเปลี่ยนรูปอยู่



func show_popup(text: String):
	var popup_label = get_tree().get_current_scene().get_node("PopupLabel")
	if popup_label:
		popup_label.text = text
		popup_label.add_theme_color_override("font_color", Color("FFD700"))  # สีทอง
		popup_label.visible = true
		await get_tree().create_timer(2.0).timeout
		popup_label.visible = false
