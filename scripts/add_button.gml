///add_button(x_offset, y_offset, text, user_def_num)
var new_button = ds_map_create();
ds_map_add(new_button, "x_offset", argument0);
ds_map_add(new_button, "y_offset", argument1);
ds_map_add(new_button, "text", argument2);
ds_map_add(new_button, "user_def_num", argument3);
buttons[button_count] = ds_map_create();
ds_map_copy(buttons[button_count], new_button);
button_count++;
