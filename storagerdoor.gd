extends Area2D

@export var normal_tex: Texture2D
@export var hover_tex: Texture2D

@onready var sprite: Sprite2D = $Sprite2D # แก้ไขตรงนี้

@onready var door_sound: AudioStreamPlayer = $DoorSound

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
		door_sound.play()
		await door_sound.finished
		get_tree().change_scene_to_file("res://storageroomtogetring.tscn")
