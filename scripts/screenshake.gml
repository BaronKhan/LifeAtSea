// *Note- This is where you cause the screen to actually shake.
target = obj_camera; // The object that you want to set the shaking values to. Here, we want the camera to shake, so...

target.shakex = global.scrshake; // Sets the camera's horizontal shaking equal to what it is in the options menu.
target.shakey = global.scrshake; // Sets the camera's vertical shaking equal to what it is in the options menu.
