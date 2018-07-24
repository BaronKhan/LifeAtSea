///save_data(section, key, val);
ini_open(working_directory+"life-at-sea-save-data.ini");
ini_write_real(argument0, argument1, argument2);
ini_close();
//Create hash for save file
/*var md5 = md5_file("life-at-sea-save-data.ini");
ini_open("life-at-sea.hash");
ini_write_string("DO_NOT_DELETE_THIS_FILE", "Hash", md5);
ini_close();*/
