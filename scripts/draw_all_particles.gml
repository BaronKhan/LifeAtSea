//draw_all_particles();
for (i=1; i<ds_grid_height(global.phyParticleGrid); i+=1) //go through every particle
{
    var pt = ds_grid_get(global.phyParticleGrid, 1, i); //get particle flag
    physics_particle_draw(pt, get_particle_id(pt), get_particle_sprite(get_particle_id(pt)), animate_particle(get_particle_id(pt), .1)); //draw every particle
};

