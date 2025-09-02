extends VideoStreamPlayer

@export var next_scene: String = "res://main_menu.tscn"

func _ready() -> void:
	# ถ้ามีวิดีโออยู่ใน stream และ autoplay ถูกเปิดไว้
	if stream:
		play()
		connect("finished", Callable(self, "_on_video_finished"))

func _on_video_finished():
	get_tree().change_scene_to_file(next_scene)
