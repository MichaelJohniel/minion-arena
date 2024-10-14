/// scr_part_dust_init
{
    //Initialize our global particle
    global.pt_dust = part_type_create();
    var pt = global.pt_dust
    
    // set the settings for the dust particle
    part_type_direction(pt,0,180,-.1,.1);
    part_type_shape(pt, pt_shape_square);
    part_type_size(pt,.03,.05,0,.01);
    part_type_color_rgb(pt,159,159,93,93,57,57);
    part_type_speed(pt,.3,.6,-.01,0);
    part_type_gravity(pt,.05,90);
    part_type_alpha2(pt, 1, 0);
    part_type_life(pt,10,15);
    
}
