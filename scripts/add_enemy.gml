///add_enemy(enemy_object)
//returns whether an enemy could be placed
if (object_exists(argument0)) {
  if (argument0 != obj_enemy_battleship) {
    x_pos = random_range(0,room_width);
    y_pos = random_range(500, room_height - 150);
    if (
        (x_pos < view_xview-64) ||
        (x_pos > view_xview+view_wview+64) ||
        (y_pos < view_yview-64) ||
        (y_pos > view_yview+view_hview+64)
      )
    {
      instance_create(x_pos, y_pos, argument0);
      return true;
    }
  }
}

return false;
