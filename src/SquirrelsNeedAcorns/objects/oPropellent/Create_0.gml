//Generated for GMS2 in Geon FX v1.3.2
//Put this code in Create event
if(live_call()) return live_result;
//TODO: Add code to thrust with image angle



//Generated for GMS2 in Geon FX v1.3.2
//Put this code in Create event

//thrust_fire_standard Particle System
global.ps = part_system_create();
part_system_depth(global.ps, -1);

//thrust_fire_standard Particle Types
//Effect1
global.pt_Effect1 = part_type_create();
part_type_shape(global.pt_Effect1, pt_shape_pixel);
//spr_4x4Cross = sprite_add("4x4Cross.png", 1, 0, 0, 2, 2);
part_type_sprite(global.pt_Effect1, spr_4x4Cross, 1, 0, 0);
part_type_size(global.pt_Effect1, 1, 1, 0.03, 0);
part_type_scale(global.pt_Effect1, 1, 1);
part_type_orientation(global.pt_Effect1, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect1, 65535, 4235519, 255);
part_type_alpha3(global.pt_Effect1, 0.89, 0.26, 0);
part_type_blend(global.pt_Effect1, 0);
part_type_life(global.pt_Effect1, 10, 30);
part_type_speed(global.pt_Effect1, 1.50, 2.25, 0, 0);
part_type_direction(global.pt_Effect1, 255, 285, 0, 0);
part_type_gravity(global.pt_Effect1, 0, 0);

//Effect2
global.pt_Effect2 = part_type_create();
part_type_shape(global.pt_Effect2, pt_shape_pixel);
part_type_size(global.pt_Effect2, 1, 1, 0.01, 0);
part_type_scale(global.pt_Effect2, 1, 1);
part_type_orientation(global.pt_Effect2, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect2, 65535, 4235519, 255);
part_type_alpha3(global.pt_Effect2, 1, 1, 0.44);
part_type_blend(global.pt_Effect2, 0);
part_type_life(global.pt_Effect2, 10, 25);
part_type_speed(global.pt_Effect2, 1, 2.25, 0, 0);
part_type_direction(global.pt_Effect2, 240, 300, 0, 0);
part_type_gravity(global.pt_Effect2, 0, 0);

//Effect3
global.pt_Effect3 = part_type_create();
part_type_shape(global.pt_Effect3, pt_shape_pixel);
//spr_4x4Cross = sprite_add("4x4Cross.png", 1, 0, 0, 2, 2);
part_type_sprite(global.pt_Effect3, spr_4x4Cross, 1, 0, 0);
part_type_size(global.pt_Effect3, 1, 1, 0.15, 0);
part_type_scale(global.pt_Effect3, 1, 1);
part_type_orientation(global.pt_Effect3, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect3, 10660784, 6976900, 4937052);
part_type_alpha3(global.pt_Effect3, 0.27, 1, 0);
part_type_blend(global.pt_Effect3, 0);
part_type_life(global.pt_Effect3, 25, 35);
part_type_speed(global.pt_Effect3, 1.50, 2.25, 0, 0);
part_type_direction(global.pt_Effect3, 255, 285, 0, 0);
part_type_gravity(global.pt_Effect3, 0, 0);

//thrust_fire_standard Emitters
global.pe_Effect1 = part_emitter_create(global.ps);
global.pe_Effect2 = part_emitter_create(global.ps);
global.pe_Effect3 = part_emitter_create(global.ps);

//thrust_fire_standard emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.ps, global.pe_Effect3, xp-2, xp+2, yp-2, yp+2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_Effect3, global.pt_Effect3, 4);
part_emitter_region(global.ps, global.pe_Effect2, xp-2, xp+2, yp-2, yp+2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_Effect2, global.pt_Effect2, 9);
part_emitter_region(global.ps, global.pe_Effect1, xp-2, xp+2, yp-2, yp+2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.ps, global.pe_Effect1, global.pt_Effect1, 16);

//Destroying Emitters
//part_emitter_destroy(global.ps, global.pe_Effect1);
//part_emitter_destroy(global.ps, global.pe_Effect2);
//part_emitter_destroy(global.ps, global.pe_Effect3);