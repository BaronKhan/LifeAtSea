/*
  LoadGame sets up our important variables, either loading them in from an existing save file or creating from defaults.
  
  It also checks the validation of the save file, deleting any "corrupted" files, so that players cannot cheat.
  
  Note that you must have provided your own gameID, as found in GGS > General, to objSaveLoad's Create event otherwise 
  you will use a generic ID other users of this package might also forget to replace.
*/

global.saveData = ds_map_create(); // Create our save data variable to be accessed throughout the rest of the game

if (file_exists("saveData.bin")) // Yes, we do have a save file already
{
    // Load in our previous values 
    global.saveData = ds_map_secure_load("saveData.bin")
    
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
    // The gameID here must match the one in SaveGame
    var validation = 266826509 / playerInt; 
    
    if (global.saveData[? "validation"] == validation) // If we have passed validation checks
    {
        global.saveData[? "loaded"] = 1;  // Set that we HAVE loaded in this save file
    }
    else
    {
        show_message_async("Save file has been corrupted!");
        file_delete("saveData.bin");
    }
}

// Now "repair a corrupted" save file or set the defaults if no save file exists
if (!file_exists("saveData.bin"))
{
    global.saveData[? "playerName"] = "";
    global.saveData[? "counter1"] = 0;
    global.saveData[? "counter2"] = 100;
    global.saveData[? "stringOne"] = "Well Done!";
    global.saveData[? "stringTwo"] = "Hello";
    global.saveData[? "loaded"] = 0;
}
