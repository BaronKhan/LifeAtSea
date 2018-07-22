///add_menu_button(menu_id, button_index, max_buttons, text);
//Note: event_num = button_index

//Calculate button position
var total_length;
if (global.use_vfx && os_type == os_windows) {
  total_length = (argument2*(180))-96; //116 + 64 gap
} else {
  total_length = (argument2*(180))-168; //116 + 64 gap
}

var x_pos = (view_xview[0] + (view_wview[0]/2)) - (total_length/2) + (argument1*180)

with (instance_create(x_pos, 664, obj_menu_button)) {
  menu_id = argument0;
  event_num = argument1;
  text = argument3;
}
