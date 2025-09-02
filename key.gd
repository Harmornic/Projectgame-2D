extends Area2D

@export var normal_tex: Texture2D
@export var hover_tex: Texture2D
@export var sprite_path: NodePath = NodePath("Sprite2D")

@onready var sprite: Sprite2D = get_node(sprite_path)

func _ready() -> void:
	if normal_tex:
		sprite.texture = normal_tex
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	if hover_tex:
		sprite.texture = hover_tex

func _on_mouse_exited() -> void:
	if normal_tex:
		sprite.texture = normal_tex

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Global.has_key = true
		show_popup("คุณเก็บกุญแจแล้ว!")
		visible = false
		set_process(false)

func show_popup(text: String):
	var popup_label = get_tree().get_current_scene().get_node("PopupLabel")
	if popup_label:
		popup_label.text = text
		popup_label.add_theme_color_override("font_color", Color("FFD700"))  # สีเหลืองทอง
		popup_label.visible = true
		await get_tree().create_timer(2.0).timeout
		popup_label.visible = false
