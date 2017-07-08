///cleanup_phy_particles();
//Destroy the two data structures we've created to free up memory. I'd run this in a Room End event.
ds_map_destroy(global.phyParticleIDMap);
ds_grid_destroy(global.phyParticleGrid);
