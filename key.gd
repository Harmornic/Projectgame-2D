extends Area2D

@export var normal_tex: Texture2D
@export var hover_tex: Texture2D
@export var sprite_path: NodePath = NodePath("Sprite2D")  # ค่าเริ่มต้น

@onready var sprite: Sprite2D = get_node(sprite_path)

func _ready() -> void:
	if sprite == null:
		push_error("Sprite path not set on %s" % name)
		return
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
