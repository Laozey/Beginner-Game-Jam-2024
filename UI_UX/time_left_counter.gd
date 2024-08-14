extends Node

@onready var label = $Label
@onready var timer = $Timer
@onready var qmark = $"Question Mark"
var countdown_start_time = 5 * 60  # Time to count down from (5 minutes) in seconds
var total_time = countdown_start_time  # Initialize total time with countdown_start_time
var negative_phase_started = false  # Flag to check if we started counting negative time

func _ready():
	timer.wait_time = 1  # Timer will tick every second
	timer.one_shot = false  # Timer should repeat
	timer.start()
	timer.timeout.connect(_on_Timer_timeout)  # Connect signal to the timeout method
	qmark.hide()

func _on_Timer_timeout():
	if total_time > -5 * 60:
		total_time -= 1  # Decrease total time by 1 second
		
		if total_time <= 0 and not negative_phase_started:
			negative_phase_started = true  # Start counting negative time
			total_time = -1  # Ensure it shows -00:00 initially
			qmark.show()
		
	# Stop the timer once it has reached -5 minutes
	if total_time <= -5 * 60:
		total_time = -5 * 60
		label.text = "-05:00"
		timer.stop()
		return

	# Update the label with the formatted time
	label.text = time_until_victory()

func time_until_victory() -> String:
	var minutes = int(abs(total_time) / 60)  # Get absolute value for minutes
	var seconds = int(abs(total_time) % 60)  # Get absolute value for seconds
	var sign = "-" if total_time < 0 else ""  # Add negative sign if in negative phase
	return sign + "%02d:%02d" % [minutes, seconds]
