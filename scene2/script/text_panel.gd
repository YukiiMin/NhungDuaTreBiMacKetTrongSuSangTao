extends Panel

var dialogues = [
	"Trời ơi… hôm nay là ngày mới rồi sao…Ánh sáng chiếu vào mắt chói quá… ước gì được ngủ thêm năm phút nữa.",
	"Không được. Mình đã là sinh viên năm cuối rồi mà, mình sắp phải ra trường đi làm rồi mà. Mình phải cố gắng lên"
]

var current_dialogue_index = 0
var text_label: Label
var continue_button: Button

func _ready():
	# Lấy references
	text_label = $TextLabel
	continue_button = $ContinueButton
	
	# Kết nối signal button
	continue_button.pressed.connect(_on_continue_pressed)
	
	# Hiển thị hội thoại đầu tiên
	text_label.text = dialogues[0]
	
	# Bắt đầu với alpha = 0 (trong suốt hoàn toàn)
	modulate.a = 0
	
	# Tạo hiệu ứng fade in
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "modulate:a", 1.0, 0.8)

func _on_continue_pressed():
	current_dialogue_index += 1
	
	if current_dialogue_index < dialogues.size():
		# Hiển thị hội thoại tiếp theo
		text_label.text = dialogues[current_dialogue_index]
		
		# Nếu là hội thoại cuối, đổi text button
		if current_dialogue_index == dialogues.size() - 1:
			continue_button.text = "Close"
	else:
		# Đã hết hội thoại, ẩn panel
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN)
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.tween_callback(func(): 
			visible = false
			# Hiển thị notification
			var notification = get_node("../NotificationLabel")
			if notification:
				notification.visible = true
		)
