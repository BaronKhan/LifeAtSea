///init_phy_particles();

//Set the max particle count here:
global.maxParticleCount = 10000; //Maybe you should set this based on the device being used?
physics_particle_set_max_count(global.maxParticleCount);

//ID initalization. Make sure these have been run at least once before you create any particles!
init_particle_id();
init_particle_data();

//Create your particles here. See the README for a guide.
global.Water = create_phy_particle(phy_particle_flag_water | phy_particle_flag_colourmixing, sprWater, 0);
global.Lava = create_phy_particle(phy_particle_flag_water | phy_particle_flag_colourmixing | phy_particle_flag_viscous, sprLava, 1);
global.Sand = create_phy_particle(phy_particle_flag_powder, sprSand, 0);

//Particle Global Properties
physics_particle_set_radius(2);
physics_particle_set_density(30);
/*switch (room) //I base mine on the room.
{
    case rmWater:
        physics_particle_set_radius(3);
        physics_particle_set_density(0.5);
    break;
    case rmSand:
        physics_particle_set_radius(2);
        physics_particle_set_density(30);
    break;
    case rmWaveMachine:
        physics_particle_set_radius(3);
        physics_particle_set_density(0.5);
    break;
    case rmLava:
        physics_particle_set_radius(3);
        physics_particle_set_density(3);
    break;
    default:
        physics_particle_set_radius(3);
        physics_particle_set_density(0.5);                         
}*/
 
/* Other possible particle properties:
physics_particle_set_density(0.5);
physics_particle_set_damping(1);
physics_particle_set_gravity_scale(1);
*/
