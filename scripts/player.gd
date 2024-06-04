extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var coyote_frames : int = 6
var coyote : bool = false
var last_floor : bool = false
var direction : float
var facing_direction : int = 1

@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sound = $JumpSound
@onready var coyote_timer = $CoyoteTimer

func _ready():
	coyote_timer.wait_time = coyote_frames / 60.0
	pass

func _physics_process(delta):
	#print(get_tree().current_scene)
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or coyote):
		velocity.y = JUMP_VELOCITY
		jump_sound.play()
	if velocity.y < 0 and !Input.is_action_pressed("jump"):
		#print(Input.is_action_pressed("jump"))
		velocity.y = max(velocity.y, 0)
		#print(Input.is_action_pressed("jump"))
	print(str(direction))
	#if Input.is_action_just_pressed("dash"):
		#velocity.x += 1000 * sign(facing_direction)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		facing_direction = sign(direction)
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	if !is_on_floor() and last_floor: # and !jumping:
		coyote = true
		coyote_timer.start()
	
	if direction and velocity.x < 150 and get_node_or_null("CollisionShape2D") != null: # third check is trying to slow-down after-death movement
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("dash"):
		velocity.x = 950 * sign(facing_direction)
	
	last_floor = is_on_floor() #sequencing thing here?
	
	move_and_slide()


func _on_coyote_timer_timeout():
	coyote = false # Replace with function body.
