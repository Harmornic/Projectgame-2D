# start.gd
extends Button

@onready var start_sound: AudioStreamPlayer = $StartSound
@onready var fade_screen: Control = get_node("../FadeScreen") # แก้ไขตรงนี้

func _on_pressed() -> void:
	start_sound.play()
	await start_sound.finished

	if fade_screen:
		var tween = create_tween()
		tween.tween_property(fade_screen, "modulate", Color(0, 0, 0, 1.0), 1.0)
		await tween.finished
		get_tree().change_scene_to_file("res://firstroom.tscn")
	else:
		get_tree().change_scene_to_file("res://firstroom.tscn")
