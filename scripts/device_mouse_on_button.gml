///device_mouse_on_button(button_x, button_y, mouse_id);
var button_x = argument0;
var button_y = argument1;
return (device_mouse_x(argument2) > button_x - 58 &&
        device_mouse_x(argument2) < button_x + 58 &&
        device_mouse_y(argument2) > button_y - 21 &&
        device_mouse_y(argument2) < button_y + 21);
