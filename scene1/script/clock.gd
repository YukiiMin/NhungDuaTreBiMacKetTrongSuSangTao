extends Area2D

var alarm_sound: AudioStreamPlayer
var is_alarm_playing = false

func _ready():
	# Lấy node âm thanh
	alarm_sound = $AlarmSound
	
	# Kết nối signal khi click vào đồng hồ
	input_event.connect(_on_input_event)
	
	# Kết nối signal khi chuột vào/ra vùng đồng hồ
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_input_event(_viewport, event, _shape_idx):
	# Khi người chơi click vào đồng hồ
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if is_alarm_playing:
			# Tắt âm thanh đồng hồ
			stop_alarm()
			print("Đã tắt âm thanh đồng hồ!")
			
			# Chuyển sang scene 2
			await get_tree().create_timer(0.3).timeout  # Delay ngắn để mượt hơn
			get_tree().change_scene_to_file("res://scene2/Scene_2.tscn")

func _on_mouse_entered():
	# Thay đổi con trỏ chuột khi di vào vùng đồng hồ
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	# Trở về con trỏ mặc định khi di ra
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

# Hàm bật âm thanh đồng hồ (được gọi từ nút OK)
func start_alarm():
	if alarm_sound and not is_alarm_playing:
		alarm_sound.play()
		is_alarm_playing = true
		print("Âm thanh đồng hồ bắt đầu reo!")

# Hàm tắt âm thanh đồng hồ
func stop_alarm():
	if alarm_sound and is_alarm_playing:
		alarm_sound.stop()
		is_alarm_playing = false
