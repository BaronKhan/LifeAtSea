///mouse_on_button(button_x, button_y);
var button_x = argument0;
var button_y = argument1;
return (mouse_x > button_x - 58 &&
        mouse_x < button_x + 58 &&
        mouse_y > button_y - 21 &&
        mouse_y < button_y + 21);
