extends Node


var player_health: float = 100
var xp: float = 0


func decrease_health(h: float):
	player_health -= h


func get_player_health() -> float:
	return player_health


func add_xp(points: float):
	xp += points


func get_xp() -> float:
	return xp
