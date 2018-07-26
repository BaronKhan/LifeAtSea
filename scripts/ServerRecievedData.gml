/// Read incoming data to the server from a connected saocket
{  
    // get the buffer the data resides in
    var buff = ds_map_find_value(async_load, "buffer");
    
    // read ythe command 
    var cmd = buffer_read(buff, buffer_s16 );

    // Get the socket ID - this is the CLIENT socket ID. We can use this as a "key" for this client
    var sock = ds_map_find_value(async_load, "id");

    // Is this a TOUCH command?
    if( cmd==TOUCH_CMD )    
    {
        // Read the stick positions that was sent
        var lStick_ = buffer_read(buff, buffer_s16 );
        var dStick_ = buffer_read(buff, buffer_s16 );
        var lStick2_ = buffer_read(buff, buffer_s16 );
        var dStick2_ = buffer_read(buff, buffer_s16 );
    
        //Assign stick positions to co-op helper
        with (obj_ship_coop) {
          lStick = lStick_;
          dStick = dStick_;
          lStick2 = lStick2_;
          dStick2 = dStick2_;
        }
        //show_debug_message("Received touch from client")
        //show_debug_message("lStick="+string(lStick_)+", dStick="+string(dStick_));
        //show_debug_message("lStick2="+string(lStick2_)+", dStick2="+string(dStick2_));
    } else if( cmd==PING_CMD )
    {
        // keep alive - ignore it
    }
}


