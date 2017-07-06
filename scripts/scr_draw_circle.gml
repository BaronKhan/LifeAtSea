///scr_draw_circle(x,y,Thickness,Radio,StartAngle,TotalAngle,Segments,Color,Points,Max Points); 
var i,j;
var h = ((round(argument8*(argument5)/argument6)*argument6))/argument9;
draw_primitive_begin(pr_trianglestrip); 
draw_set_colour(argument7);
for(i = argument4 ; i <= argument4 + argument5 ; i += argument5/argument6){ 
    if i <= h+argument4{ 
        draw_vertex(argument0 + lengthdir_x( argument3, i), argument1 + lengthdir_y( argument3, i)); 
        draw_vertex(argument0 + lengthdir_x( argument3 + argument2, i), argument1 + lengthdir_y( argument3+ argument2, i));
    };
};
draw_primitive_end(); 
