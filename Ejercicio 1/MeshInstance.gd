extends MeshInstance

func _ready():
	var vertices := PoolVector3Array([Vector3(-1,0,1), Vector3(1,0,1), Vector3(-1,2,1), Vector3(1,2,1),
					Vector3(-1,0,-1), Vector3(1,0,-1), Vector3(-1,2,-1), Vector3(1,2,-1)])
	
	var indices :=  PoolIntArray([0,1,2, 1,3,2, 2,3,7, 2,7,6, 1,7,3, 1,5,7, 6,7,4 ,7,5,4,
					 0,4,1, 1,4,5, 2,6,4, 0,2,4])
						
	var arr := []
	arr.resize(Mesh.ARRAY_MAX)
	arr[Mesh.ARRAY_VERTEX] = vertices
	arr[Mesh.ARRAY_INDEX] = indices	
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)

func _process(delta):
	rotate_y(delta)
