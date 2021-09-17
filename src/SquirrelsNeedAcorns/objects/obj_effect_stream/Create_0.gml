//Call this function to load Geon FX effect from a file. argument0 is fname. argument1 is a Particle System if you want to use a different one for this particular effect.
//Or just leave -1 if you"re OK with default Particle System
effect[0] = geon_effect_add("geon_fx/effects/fire.geon");
effect[1] = geon_effect_add("geon_fx/effects/asteroid.geon");
effect[2] = geon_effect_add("geon_fx/effects/rain.geon");
effect[3] = geon_effect_add("geon_fx/effects/electro.geon");
effect[4] = geon_effect_add("geon_fx/effects/wormhole.geon");
effect[5] = geon_effect_add("geon_fx/effects/portal.geon");
sel = 0;
stream = 1;

ef_name[0] = "Fire";
ef_name[1] = "Asteroid shower";
ef_name[2] = "Rain";
ef_name[3] = "Electro";
ef_name[4] = "Wormhole";
ef_name[5] = "Portal";

dir = 0;
