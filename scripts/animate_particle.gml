///animate_particle(id, image speed);

//Check if this particle is animated
if (ds_grid_get(global.phyParticleGrid, 3, argument0) == 1)
{
    //increment the frame
    var f = (ds_grid_get(global.phyParticleGrid, 4, argument0) + (1 * argument1));
    
    //check if frame has reached last frame in sprite
    if (f > sprite_get_number(get_particle_sprite(argument0)) - 1)
    {
        //it has, so reset back to 0
        f = 0;
    };
    
    //save our frame for next step    
    ds_grid_set(global.phyParticleGrid, 4, argument0, f);
    
    //return current frame
    return f;    
};

return 0; //if particle is not animated, their only image index is 0, so return that.
