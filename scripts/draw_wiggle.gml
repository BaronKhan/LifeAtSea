//draw_wiggle(x,y,path0,path1,path3,sprite_get_texture(sprite0,0),wiggleposition(0 is start, 1 is end),vertical,wiggledir)
//like draw banner but this tim path 3 defines the wiggle, and position defines the wiggle position
//x,y, the position of the first point of the banner will be at. use 0,0 for absolute
//   the first point of the top or left border (path0) is used to figure to absolute position
//path0, path1, the 2 paths constituting the banner edges
//texture, the texture of the banner
//wiggle position. Pass a value from 0 to 1, incrementing my .01 for example, or 0 to -1 to reverse the movement... 
//   Actually, mod is used so you simply need to pass a forever increasing or decreasing value 
//vertical, if true the texture is mapped vertically... If you make the paths go from top to bottom, set this to 1

//The number of ripples in the flag depend on the number of point or rather waves in the wiggle path.
// the wiggle path is better if it forms tiny repetitive circles
//wiggledir 1 is from right to left, -1 is from left to right

//use draw set color to change the color in your code
//YOU MUST HAVE THIS
//draw_set_color(image_blend);

dummy = argument5

//Start the primitive
var i; i = 0;
draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr_flag,0))
var xx,yy;
xx = 0;
yy = 0;
//If x,y is used, figure out where the first point is on the path and use as offest
if(argument0 <> 0 or argument1 <> 0)
{
xx = argument0-path_get_point_x(argument2,0);
yy = argument1-path_get_point_y(argument2,0);
}
//Get the offset of the first wiggle point so user can make the wiggle from any position withou affecting the end result
var wx,wy,wi;
wx = -path_get_point_x(argument4,0)
wy = -path_get_point_y(argument4,0)
//get the posiiton of the wiggl
wi = argument6
//if horizontal
if(argument7 == 0)
repeat(100)
{
    //keep wiggle within limits
    if (wi>1) wi = frac(wi)
    if (wi<0) wi = 1-frac(wi)
    draw_vertex_texture(path_get_x(argument2,i)+path_get_x(argument4,wi)+wx+xx,path_get_y(argument2,i)+path_get_y(argument4,wi)+wy+yy,i,0)
    draw_vertex_texture(path_get_x(argument3,i)+path_get_x(argument4,wi)+wx+xx,path_get_y(argument3,i)+path_get_y(argument4,wi)+wy+yy,i,1)
    i+=.01;
    //add to wiggle
    wi+=.01*argument8

}
else if(argument7 == 1) //if vertical
repeat(100)
{
    //keep wiggle within limits
    if (wi>1) wi = frac(wi)
    if (wi<0) wi = 1-frac(wi)
    draw_vertex_texture(path_get_x(argument2,i)+path_get_x(argument4,wi)+wx+xx,path_get_y(argument2,i)+path_get_y(argument4,wi)+wy+yy,0,i)
    draw_vertex_texture(path_get_x(argument3,i)+path_get_x(argument4,wi)+wx+xx,path_get_y(argument3,i)+path_get_y(argument4,wi)+wy+yy,1,i)
    i+=.01;
    //add to wiggle
    wi+=.01*argument8
}
draw_primitive_end()
