//scr_dash_state
//Create hitbox
if !(instance_exists(obj_player_dash))
    {instance_create(x, y-16, obj_player_dash);}
        
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
    }
    
//Create the dash effect
var dash = instance_create(x, y, obj_dash_effect);
dash.sprite_index = sprite_index;
dash.image_index = image_index;
dash.image_xscale = image_xscale;

//Control the sprite
sprite_index = spr_player_dash;
image_speed = 0;

//Control the direction
if (xprevious < x) {image_index = 1};
if (xprevious > x) {image_index = -1};
