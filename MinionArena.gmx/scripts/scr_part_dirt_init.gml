/// scr_part_dirt_init
{
    //Initialize our global particle
    global.pt_dirt = part_type_create();
    var pt = global.pt_dirt
    
    // set the settings for the blood particle
    part_type_shape(pt, pt_shape_square);
    part_type_size(pt,.01,.03,0,.01);
    part_type_color_rgb(pt,159,159,93,93,57,57);
    part_type_speed(pt,.5,3,-.1,0);
    part_type_direction(pt,0,360,0,0);
    part_type_gravity(pt,.05,270);
    part_type_life(pt,10,15);
}
