if (instance_number(obj_controller) > 0)
{
  with (obj_controller) {
    space_found = false;
    for (i = 0; i < 5; ++i) {
      if (messages[i] == "") {
        messages[i] = argument0;
        space_found = true;
        break;
      }
    }
    if (!space_found) {
      //shift messages upwards
      for (i = 1; i < 5; ++i) {
        messages[i-1] = messages[i];
      }
      messages[4] = argument0;
    }
    alarm[1] = room_speed * 3;
  }
}
