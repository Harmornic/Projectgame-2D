# start.gd
extends Button

@onready var start_sound: AudioStreamPlayer = $StartSound


func _on_pressed() -> void:
	start_sound.play()
	await start_sound.finished
	get_tree().change_scene_to_file("res://firstroom.tscn")
