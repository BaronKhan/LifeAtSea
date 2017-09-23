///draw_banner(x,y,path0,path1,texture,scrollposition,vertical)
//Draw a banner merging 2 paths as bannertop and banner bottom or banner left and banner right edges
//x,y, the position of the first point of the banner will be at. use 0,0 for absolute
//   the first point of the top or left border (path0) is used to figure to absolute position
//path0, path1, the 2 paths constituting the banner edges
//texture, the texture of the banner
//scroll position. when 0, the left or top of the texture will be at the start of the banner
//   when -1, the left or top of the texture will be at the last point of the banner
//   when 1, the right or bottom of the texture will be at the start of the banner
//   so, going from -1 the to 0 the banner will go from off the banner edge (invisible on the right if banner goes from left to right)
//       to being fully displayed the lenght of the banner
//   from 0 to -1, the banner will scroll left even more until it is gone. 
//      Setup a variable to go from -1 to 1 step .01  to scroll the banner right to left
//vertical, if true the texture is mapped vertically... If you make the paths go from top to bottom, set this to 1

//use draw set color to change the color in your code
//YOU MUST HAVE THIS
//draw_set_color(image_blend);

dummy = argument4

//Start the primitive
var i; i = 0;
draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr_wind,0))
var xx,yy;
xx = 0;
yy = 0;
//If x,y is used, figure out where the first point is on the path and use as offest
if(argument0 <> 0 or argument1 <> 0)
{
xx = argument0-path_get_point_x(argument2,0);
yy = argument1-path_get_point_y(argument2,0);
}
//if horizontal
if(argument6 == 0)
repeat(100)
{
    draw_vertex_texture(path_get_x(argument2,i)+xx,path_get_y(argument2,i)+yy,i+argument5,0)
    draw_vertex_texture(path_get_x(argument3,i)+xx,path_get_y(argument3,i)+yy,i+argument5,1)
    i+=.01;
}
else if(argument6 == 1) //if vertical
repeat(100)
{
    draw_vertex_texture(path_get_x(argument2,i)+xx,path_get_y(argument2,i)+yy,0,i+argument5)
    draw_vertex_texture(path_get_x(argument3,i)+xx,path_get_y(argument3,i)+yy,1,i+argument5)
    i+=.01;
}
draw_primitive_end()
