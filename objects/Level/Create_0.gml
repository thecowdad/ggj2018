
randomize();

global.TILE_SIZE=128;

for (var i =1; i < room_width div global.TILE_SIZE;i++)
{
	for(var j = 0; j < room_height div global.TILE_SIZE;j++)
	{
		instance_create_layer(i*global.TILE_SIZE, j*global.TILE_SIZE,"Walls",oWall);
	}
}

var dir = 0;

var maxDistanceX = 0;
var maxDistanceY =0;
var distance =0
var maxDistance = 0;

repeat(150)
{
	if(chance(20)){
	dir = choose(0,1,2,3)*90;
	}
	
	var object = instance_place(x, y, oWall);
	
	instance_destroy(object);
	
	x+= lengthdir_x(global.TILE_SIZE, dir);
	y+= lengthdir_y(global.TILE_SIZE, dir);
	
	x = clamp(x, 0 + global.TILE_SIZE, room_width-global.TILE_SIZE*2);
	y = clamp(y, 0+ global.TILE_SIZE, room_height -global.TILE_SIZE*2);
	distance = point_distance(0,0,x,y)
	if(maxDistance < distance)
	{
		maxDistance = distance;
		maxDistanceX = x;
		maxDistanceY = y;
	}
	
}


instance_create_layer(10,10,"Player", obj_player);
instance_create_layer(maxDistanceX, maxDistanceY,"Exit", obj_exit);