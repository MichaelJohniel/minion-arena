///scr_slash_state
//Forcefully Fall
// gravity 
    if (vspd < 8)
        {vspd += (grav+1)};
    if (vspd >= 8)
        {vspd += (grav+2)};
    if (vspd >= 25)
        {vspd = 25};

// Vertical Collisions
if (place_meeting(x, y+vspd, obj_solid)) 
    {
    while (!place_meeting(x, y+sign(vspd), obj_solid)) 
        {y += sign(vspd);}
    vspd = 0; 
    }

// Move Vertically
y += vspd;

//Go back to move state with landing
if (place_meeting(x, y+1, obj_solid)) 
    {
    vspd = 0;
    state = scr_move_state
    {part_particles_create(global.ps,x-16,y,global.pt_dust,50);}
    {part_particles_create(global.ps,x+16,y,global.pt_dust,50);}
    }

//Control the sprite
if !(place_meeting(x, y+1, obj_solid))
    {
    sprite_index = spr_player_jump;
    image_speed = 0;
    image_index = 1;
    }

//Control the direction
if (xprevious < x) {image_index = 1};
if (xprevious > x) {image_index = -1};
