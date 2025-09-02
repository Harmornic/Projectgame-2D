extends Area2D

@export var normal_tex: Texture2D
@export var hover_tex: Texture2D
@export var clicked_tex: Texture2D
@export var sprite_path: NodePath = NodePath("Sprite2D")

@onready var sprite: Sprite2D = get_node(sprite_path)
@onready var popup_label: Label = get_node("../../PopupLabel")
@onready var woman_song: AudioStreamPlayer = $WomanSongPlayer

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
		if not is_clicked:
			Global.has_key2 = true
			is_clicked = true
			
			woman_song.play()
			
			if clicked_tex:
				sprite.texture = clicked_tex
			
			show_popup("คุณได้รับกุญแจล็อคเกอร์")
			
			# ✅ รอให้เพลงจบก่อน
			await woman_song.finished
			
			# ✅ ค่อยลบโหนด
			queue_free()

func show_popup(text: String):
	if popup_label:
		popup_label.text = text
		popup_label.add_theme_color_override("font_color", Color("ADADAD"))
		popup_label.visible = true
		await get_tree().create_timer(2.0).timeout
		popup_label.visible = false
