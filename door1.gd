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
		if Global.has_key:
			get_tree().change_scene_to_file("res://bigroom.tscn")
		else:
			show_locked_popup()

func show_locked_popup():
	var popup_label = get_tree().get_current_scene().get_node("PopupLabel")
	if popup_label:
		popup_label.text = "ประตูล็อคอยู่ ต้องมีกุญแจก่อน"
		popup_label.visible = true
		await get_tree().create_timer(2.0).timeout
		popup_label.visible = false
