///SendTouch(obj_controller)
var controller = argument0;

//dstick, lstick, dstick2, lstick2

// Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
buffer_seek(buff, buffer_seek_start, 0);

buffer_write(buff, buffer_s16, TOUCH_CMD );
buffer_write(buff, buffer_s16, controller.lStick );
buffer_write(buff, buffer_s16, controller.dStick );
buffer_write(buff, buffer_s16, controller.lStick2 );
buffer_write(buff, buffer_s16, controller.dStick2 );

// Send this to the server
network_send_packet( client, buff, buffer_tell(buff) );




