extends Area2D

@export var normal_tex: Texture2D # Texture ปกติ
@export var hover_tex: Texture2D  # Texture เมื่อเมาส์ชี้

@onready var sprite: Sprite2D = $Trueexit # แก้ไขพาธตรงนี้

func _ready() -> void:
	if normal_tex:
		sprite.texture = normal_tex
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	if hover_tex: # ตรวจสอบว่ามี hover_tex กำหนดไว้
		sprite.texture = hover_tex

func _on_mouse_exited() -> void:
	if normal_tex: # ตรวจสอบว่ามี normal_tex กำหนดไว้
		sprite.texture = normal_tex
