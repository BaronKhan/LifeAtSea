///closer_ship();
//Returns ID of closest ship to instance
var shortest_distance = 999999;
var closest_ship = -1;

if (instance_number(obj_ship) > 0) {
  var dist = distance_to_object(obj_ship);
  if (dist < shortest_distance) {
    shortest_distance = dist;
    closest_ship = obj_ship;
  }
}

if (instance_number(obj_ship_coop) > 0) {
  var dist = distance_to_object(obj_ship_coop);
  if (dist < shortest_distance) {
    shortest_distance = dist;
    closest_ship = obj_ship_coop;
  }
}

return closest_ship;
