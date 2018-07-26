///draw_trail_pos(id, x, y, length,width,color,sprite,slim,alpha)
//Ex. draw_trail(32,32,c_white,-1,1,1)
var j, xx, yy, Length,Width,Color,Sprite,Slim,Alpha,AlphaT,Texture,Dir,Min,Height,XOffest,YOffset;

//Preparing variables
j = argument0;
xx = argument1;
yy = argument2;
Length = argument3; //How many previous coordinates will use the trail
Width = argument4; //How wide will the trail be
Color = argument5; //Which color will be used to tint the trail
Sprite = argument6; //Which sprite's texture must be used for the trail. Must have "Used for 3D" marked. -1 for no sprite 
Slim = argument7; //Whether the trail will slim down at the end
Alpha = argument8; //The alpha to draw the trail with (0-1), optional
XOffset = argument9;
YOffset = argument10;

ArrayTrailx[j, 0] = xx + XOffset;
ArrayTraily[j, 0] = yy + YOffset;
ArrayTrail2[j, 0] = 0;
Height = array_length_2d(ArrayTrailx, j);

//Getting distance between current and past coordinates
if (Height > 1) ArrayTrail2[j, 0] = point_distance(ArrayTrailx[j, 0],ArrayTraily[j, 0],ArrayTrailx[j, 1],ArrayTraily[j, 1]) + ArrayTrail2[j, 1];
else ArrayTrail2[j, 0] = 0;

//Setting the texture
if (Sprite >= 0) Texture = sprite_get_texture(Sprite,0);
else Texture = -1;
texture_set_repeat(1);

//Drawing the primitive
//if (!(alarm[3] > room_speed/10)) {
  draw_primitive_begin_texture(pr_trianglestrip,Texture);
  AlphaT = 1;
  Dir = 0;
  Min = min(Height - 1,Length);
  
  for(var i = 0; i < Min; i++){
    if (ArrayTrailx[j, i] != ArrayTrailx[j, i+1] || ArrayTraily[j, i] != ArrayTraily[j, i+1])
      Dir = point_direction(ArrayTrailx[i],ArrayTraily[j, i],ArrayTrailx[j, i+1],ArrayTraily[j, i+1]);
    var Len = Width / 2 - ((i + 1) / Min * Width / 2) * Slim;
    var XX = lengthdir_x(Len,Dir + 90); 
    var YY = lengthdir_y(Len,Dir + 90);
    AlphaT = (Min - i) / (Min / 2) * Alpha;
  
      draw_vertex_texture_color(ArrayTrailx[j, i] + XX,ArrayTraily[j, i] + YY,ArrayTrail2[j, i] / Width,0,Color,AlphaT);
    draw_vertex_texture_color(ArrayTrailx[j, i] - XX,ArrayTraily[j, i] - YY,ArrayTrail2[j, i] / Width,1,Color,AlphaT);
  }
  draw_primitive_end();
//}

//Replacing the coordinates positions within the array
Min = min(Height,Length);
for (var i = Min; i > 0; i--){
  ArrayTrailx[j, i] = ArrayTrailx[j, i - 1];
  ArrayTraily[j, i] = ArrayTraily[j, i - 1];
  ArrayTrail2[j, i] = ArrayTrail2[j, i - 1];
}

