extends Area2D

@export var normal_tex: Texture2D
@export var hover_tex: Texture2D
@export var sprite_path: NodePath = NodePath("Sprite2D")
@export var next_scene_path: String = "res://puzzleroom.tscn"

@onready var sprite: Sprite2D = get_node(sprite_path)
@onready var popup_label: Label = $"../PopupLabel" # ✅ ปรับ path ให้ถูก

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
		if not Global.has_puzzle_key:
			Global.has_puzzle_key = true
			show_popup_and_change_scene("คุณได้รับกุญแจปริศนาแล้ว!")

func show_popup_and_change_scene(text: String) -> void:
	if popup_label:
		popup_label.text = text
		popup_label.visible = true
		await get_tree().create_timer(1.5).timeout
		popup_label.visible = false
	
	# เปลี่ยนฉากหลังจาก popup
	get_tree().change_scene_to_file("res://jumpscare.tscn")
