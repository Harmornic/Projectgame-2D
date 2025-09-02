# jumpscare_sound.gd
extends AudioStreamPlayer

func _ready() -> void:
	play()
	# เมื่อเสียงเล่นจบ จะกลับไปฉากก่อนหน้า
	await finished
	get_tree().change_scene_to_file("res://puzzleroom.tscn")
