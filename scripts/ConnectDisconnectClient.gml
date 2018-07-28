/// Called on a connect or disconnect of a client
{
    // get connect or disconnect (1=connect)
    var t = ds_map_find_value(async_load, "type");

    // Get the NEW socket ID, or the socket that's disconnecting
    var sock = ds_map_find_value(async_load, "socket");
    
    // Get the IP that the socket comes from
    var ip = ds_map_find_value(async_load, "ip");
    
    // Connecting?
    if( t==network_type_connect)
    {
        // add client to our list of connected clients
        ds_list_add( socketlist, sock );

        // put this instance into a map, using the socket ID as the lookup
        if (room == room_lobby_test) {
          room_goto(room_coop_test);
        } else if (room == room_title && instance_number(obj_lobby) > 0) {
          if (!obj_lobby.is_client && instance_number(obj_fade_out) == 0) {
            fade_out_to_room(room_coop_survival);
          }
        }
    }
    else
    {
        // disconnect a CLIENT. First find the player instance using the socket ID as a lookup
        
        // Also delete the socket from our global list of connected clients
        var index = ds_list_find_index( socketlist, sock );
        ds_list_delete(socketlist,index);
        if (instance_number(obj_ship) > 0) {
          if ((!obj_ship.dead) || (!obj_ship_coop.dead)) {
            show_message("Lost connection to the other player.");
            game_restart();
          }
        }
    }
}


