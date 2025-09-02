extends Area2D

@export var normal_tex: Texture2D
@export var hover_tex: Texture2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var door_sound: AudioStreamPlayer = $stonegrab # แก้ไขตรงนี้
@onready var popup_label: Label = $"../PopupLabel"

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
		Global.has_clicked_stone = true
		door_sound.play() # สั่งให้เล่นเสียง
		await door_sound.finished
		show_popup("ได้รับ ก้อนหิน")
		visible = false

func show_popup(text: String):
	if popup_label:
		popup_label.text = text
		popup_label.add_theme_color_override("font_color", Color("ADADAD"))
		popup_label.visible = true
		await get_tree().create_timer(2.0).timeout
		popup_label.visible = false
