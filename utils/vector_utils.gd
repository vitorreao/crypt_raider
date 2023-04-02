extends RefCounted
class_name VectorUtils

static func angle_in_rads(u: Vector3, v: Vector3):
	var cos = u.dot(v) / (u.length() * v.length())
	return acos(cos)
