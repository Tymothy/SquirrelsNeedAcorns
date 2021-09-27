//Generated for GMS2 in Geon FX v1.3.2
//Put this code in Create event
if(live_call()) return live_result;
//thrust_fire_standard Particle System
global.ps = part_system_create();
part_system_depth(global.ps, -1);

//thrust_fire_standard Particle Types
//Effect4
global.pt_Effect4 = part_type_create();
part_type_shape(global.pt_Effect4, pt_shape_sphere);
part_type_size(global.pt_Effect4, 1, 1, 0.10, 0);
part_type_scale(global.pt_Effect4, 0.10, 0.10);
part_type_orientation(global.pt_Effect4, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect4, 5145517, 6062494, 4873839);
part_type_alpha3(global.pt_Effect4, 1, 1, 1);
part_type_blend(global.pt_Effect4, 1);
part_type_life(global.pt_Effect4, 30, 40);
part_type_speed(global.pt_Effect4, 5, 5, 0, 0);
part_type_direction(global.pt_Effect4, 260, 280, 0, 0);
part_type_gravity(global.pt_Effect4, 0, 0);

//Effect1
global.pt_Effect1 = part_type_create();
part_type_shape(global.pt_Effect1, pt_shape_sphere);
part_type_size(global.pt_Effect1, 1, 1.50, 0.03, 0);
part_type_scale(global.pt_Effect1, 0.14, 0.14);
part_type_orientation(global.pt_Effect1, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect1, 65535, 4235519, 255);
part_type_alpha3(global.pt_Effect1, 1, 0.46, 0);
part_type_blend(global.pt_Effect1, 1);
part_type_life(global.pt_Effect1, 40, 55);
part_type_speed(global.pt_Effect1, 2, 5, 0, 0);
part_type_direction(global.pt_Effect1, 255, 285, 0, 0);
part_type_gravity(global.pt_Effect1, 0, 0);

//Effect2
global.pt_Effect2 = part_type_create();
part_type_shape(global.pt_Effect2, pt_shape_pixel);
part_type_size(global.pt_Effect2, 1, 1, 0.01, 0);
part_type_scale(global.pt_Effect2, 1, 1);
part_type_orientation(global.pt_Effect2, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect2, 65535, 4235519, 255);
part_type_alpha3(global.pt_Effect2, 1, 1, 1);
part_type_blend(global.pt_Effect2, 0);
part_type_life(global.pt_Effect2, 35, 60);
part_type_speed(global.pt_Effect2, 3, 5, 0, 0);
part_type_direction(global.pt_Effect2, 240, 300, 0, 0);
part_type_gravity(global.pt_Effect2, 0, 0);

//Effect3
global.pt_Effect3 = part_type_create();
part_type_shape(global.pt_Effect3, pt_shape_cloud);
part_type_size(global.pt_Effect3, 1, 1, 0.20, 0);
part_type_scale(global.pt_Effect3, 0.10, 0.10);
part_type_orientation(global.pt_Effect3, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect3, 10660784, 6976900, 4937052);
part_type_alpha3(global.pt_Effect3, 0, 1, 0);
part_type_blend(global.pt_Effect3, 0);
part_type_life(global.pt_Effect3, 50, 65);
part_type_speed(global.pt_Effect3, 5, 5, 0, 0);
part_type_direction(global.pt_Effect3, 255, 285, 0, 0);
part_type_gravity(global.pt_Effect3, 0, 0);

//thrust_fire_standard Emitters
global.pe_Effect4 = part_emitter_create(global.ps);
global.pe_Effect1 = part_emitter_create(global.ps);
global.pe_Effect2 = part_emitter_create(global.ps);
global.pe_Effect3 = part_emitter_create(global.ps);

//thrust_fire_standard emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.ps, global.pe_Effect3, xp-2, xp+2, yp-2, yp+2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_Effect3, global.pt_Effect3, 1);
part_emitter_region(global.ps, global.pe_Effect2, xp-2, xp+2, yp-2, yp+2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_Effect2, global.pt_Effect2, 1);
part_emitter_region(global.ps, global.pe_Effect1, xp-2, xp+2, yp-2, yp+2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_Effect1, global.pt_Effect1, 5);
part_emitter_region(global.ps, global.pe_Effect4, xp-8, xp+8, yp-8, yp+8, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_Effect4, global.pt_Effect4, 1);

//Destroying Emitters
part_emitter_destroy(global.ps, global.pe_Effect4);
part_emitter_destroy(global.ps, global.pe_Effect1);
part_emitter_destroy(global.ps, global.pe_Effect2);
part_emitter_destroy(global.ps, global.pe_Effect3);