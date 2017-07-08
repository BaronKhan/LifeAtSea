///create_phy_particle(flags, sprite, animated);

//store data about the particle in our data grid. we need this for drawing it!
var h = ds_grid_height(global.phyParticleGrid) - 1; //data structures are 0 indexed, so we subtract one

ds_grid_set(global.phyParticleGrid, 0, h, global.phyParticleID); 
ds_grid_set(global.phyParticleGrid, 1, h, argument0);
ds_grid_set(global.phyParticleGrid, 2, h, argument1);
ds_grid_set(global.phyParticleGrid, 3, h, argument2);

//make room for next particle
ds_grid_resize(global.phyParticleGrid, ds_grid_width(global.phyParticleGrid), h+1+1); 
//remember that data structures are 0 indexed, but width/height functions return 1 indexed, 
//so add 1 (then another because we're reusing the already 0 indexed height var)

//This is the really important part. We need to assign the particle an ID.
//And we do this by simply adding the flags as a key and then assigning it a value
//that is incremented for each new particle you create, so no particle has the same ID.
ds_map_add(global.phyParticleIDMap, argument0, global.phyParticleID);
global.phyParticleID += 1;

//return so we can save it in a variable
return argument0; 
