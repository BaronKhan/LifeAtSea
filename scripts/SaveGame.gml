/*
   Save our game values to a secure DS map save file.
   
   Call this script when changing rooms, ending the game, pausing, etc. Do NOT rely on just calling it in the Game End event, 
   as this is not triggered on most platforms (although if you're Windows-only you should be fine).
   
   If you want to auto-save, you might want to call this script repeatedly via an alarm set in objSaveLoad.
*/


// Process our player name, so we can use it for validation
var tempChar = "";
var playerInt =  0;

for (i = 0; i < string_length(global.saveData[? "playerName"]); i++)
{
    tempChar = string_char_at(global.saveData[? "playerName"], i);
    playerInt += ord(tempChar);
}

// Add some chosen integers onto the player name, just so they can't edit everything except for the player name
playerInt += global.saveData[? "counter1"];
playerInt += global.saveData[? "counter2"];


// Create a simple validation value using a variable the "hacker" can't know about, as the gameID is not saved to the file
// (Copy the Game ID from Global Game Settings > General and overwrite the sample one on the next line.)
var validation = 266826509 / playerInt; 


global.saveData[? "validation"] = validation;  // Embed our validation figure
global.saveData[? "loaded"] = 0;               // Set that we have not loaded this map in (yet)


ds_map_secure_save(global.saveData, "saveData.bin"); // Save the updated DS map
