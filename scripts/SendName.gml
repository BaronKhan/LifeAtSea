///SendName()

//dstick, lstick, dstick2, lstick2

// Move to start of buffer. Networking ALWAYS takes the data from the START of a buffer.
buffer_seek(buff, buffer_seek_start, 0);

buffer_write(buff, buffer_s16, NAME_CMD );
buffer_write(buff, buffer_string, global.user_name );

// Send this to the server
network_send_packet( client, buff, buffer_tell(buff) );




