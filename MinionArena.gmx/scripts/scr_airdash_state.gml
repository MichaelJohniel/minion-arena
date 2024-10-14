//scr_airdash_state
if (image_xscale = -1) {image_angle += 30;}
if (image_angle >= 360) {image_angle = 360;}
if (image_xscale = 1) {image_angle -= 30;}
if (image_angle >= -360) {image_angle = -360;}

//Create hitbox
if !(instance_exists(obj_player_dash))
    {instance_create(x, y, obj_player_dash);}
        
//Slow down the character
if (hspd > 0) {hspd -= 1};
if (hspd < 0) {hspd += 1};

// Horizontal Collisions
if (place_meeting(x+hspd, y, obj_solid)) 
    { 
    while (!place_meeting(x+sign(hspd), y, obj_solid)) 
        {x += sign(hspd);}
    hspd = 0; 
    }

//Move Horizontally
x += hspd;

//Leave the dash state
if (hspd = 0)
    {
    hspd = 0;
    state = scr_move_state;
    image_speed = 1;
    alarm[1] = 5;
    image_angle = 0;
    }

//Control the sprite
sprite_index = spr_player_dash;
image_speed = 0;

//Control the direction
if (xprevious < x) {image_index = 1};
if (xprevious > x) {image_index = -1};
