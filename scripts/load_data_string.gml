///load_data_string(section, key, default);
ini_open(working_directory+"life-at-sea-save-data.ini");
var ret = ini_read_string(argument0, argument1, argument2);
ini_close();
return ret;
