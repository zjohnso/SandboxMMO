// set scale factor for particles based on camera zoom
scale = oCameraControl.zoom + 2;

// define particle system components
particleSystem = part_system_create();
particleEmitter = part_emitter_create(particleSystem);
snowParticle = part_type_create();

// set properties of snow particles
part_type_shape(snowParticle, pt_shape_pixel);
part_type_speed(snowParticle, 1, 1.5, 0, 0);
part_type_direction(snowParticle, 270, 270, 0, 0);
part_type_color1(snowParticle, c_white);
part_type_alpha3(snowParticle, .5, .65, .25);
part_type_life(snowParticle, room_speed * 10, room_speed * 15);
part_type_scale(snowParticle, scale, scale);

// set properties of particle emitter
part_emitter_region(particleSystem, particleEmitter, 0, display_get_gui_width(), 0, 0, ps_shape_line, ps_distr_linear);
part_emitter_stream(particleSystem, particleEmitter, snowParticle, 2);

// set particle system to not automatically draw itself
part_system_automatic_draw(particleSystem, false);
