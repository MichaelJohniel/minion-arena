/// scr_part_blood_init
{
    //Initialize our global particle
    global.pt_blood = part_type_create();
    var pt = global.pt_blood
    
    // set the settings for the blood particle
    part_type_shape(pt, pt_shape_square);
    part_type_size(pt,.01,.03,0,.01);
    part_type_color_rgb(pt,120,120,44,44,35,35);
    part_type_speed(pt,.5,3,-.1,.1);
    part_type_direction(pt,0,360,0,0);
    part_type_gravity(pt,.1,270);
    part_type_life(pt,10,25);
}
