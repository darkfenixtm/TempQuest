extends KinematicBody2D

var velocidad = Vector2()
var gravedad = 10
var velocidad_lateral=200
var velocidad_salto = 200
var grupo = 0
export(int, FLAGS, "player1", "player2") var jugador = 0
func _ready():
	velocidad.x = 0
	velocidad.y = 0
	
func _physics_process(delta):
	
	velocidad.y += gravedad	
#	if (jugador==1):
	if (Input.is_action_pressed(str("player",str(jugador) ,"_der"))):
		velocidad.x = velocidad_lateral
		$Sprite.flip_h = true
		if !$Sprite.is_playing():
			$Sprite.play("Walk1")
		$Sprite.play("Walk1")
	elif (Input.is_action_pressed(str("player",str(jugador) ,"_izq"))):
		velocidad.x = -velocidad_lateral
		$Sprite.flip_h = false
		if !$Sprite.is_playing():
			$Sprite.play("Walk1")
	else:
#			$Sprite.stop()
		velocidad.x = 0 
	if (Input.is_action_pressed(str("player",str(jugador) ,"_up"))):
		velocidad.y = -velocidad_salto
		$Sprite.play("Volar1")
#		else:
#			$Sprite.stop()
#	elif (jugador==2):
#		if (Input.is_action_pressed("player2_der")):
#			velocidad.x = velocidad_lateral
#			$Sprite.flip_h = true
#		elif (Input.is_action_pressed("player2_izq")):
#			velocidad.x = -velocidad_lateral
#			$Sprite.flip_h = false
#		else:
#			$Sprite.stop()
#
#			velocidad.x = 0
#
#		if (Input.is_action_pressed("player2_up")):
#			velocidad.y = -velocidad_salto

	velocidad = move_and_slide(velocidad) 
#	var coll = get_slide_collision(0)
#	print(coll)