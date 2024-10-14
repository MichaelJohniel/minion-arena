///scr_enemy_passive

//Jump 
if place_meeting(x, y+1, obj_solid)
    {
    vspd = 0;
    grav = 1;
    djump = 1;
    }
else
    {
    //Gravity
    if (vspd < 15)
        {vspd += grav;}
    grav += .01;
    }
       
//Start Moving
if (move = 1)
    {
    //turn right
    if (place_meeting(x-1, y, obj_solid)) && (image_xscale = -1)
        {image_xscale = 1}
    //turn left
    if (place_meeting(x+1, y, obj_solid)) && (image_xscale = 1)
        {image_xscale = -1}
    //move left
    if !(place_meeting(x-1, y, obj_solid)) && (image_xscale = -1)
        {
        if hspd != -spd
            {hspd -= accel;}
        if hspd <= -spd
            {hspd = -spd;}
        }
    //move right
    if !(place_meeting(x+1, y, obj_solid)) && (image_xscale = 1) 
        {
        if hspd != spd
            {hspd += accel}
        if hspd >= spd
            {hspd = spd}
        }
    }
    
//Stop Moving
if (move = 0)
    {
    if hspd > 0 {hspd -= fric;}
    if hspd < 0 {hspd += fric;}
    }  
    
//Manage steps
if (steps > 0)
        {steps -= 1;}
if (steps <= 0)
    {
    steps = 0;
    move = 0;
    }
//Check to see if the enemy wants to move    
if (place_meeting(x, y+1, obj_solid)) && (alarm[0] = -1) && (xprevious = x) {alarm[0] = 15}  
    
 

//Become Hostile
if (distance_to_object(obj_player) < 1500)
    {state = scr_enemy_hostile}  
    
///Collisions
//Horizontal collisions
if place_meeting(x+hspd, y, obj_solid)
    {
    while !place_meeting(x+sign(hspd), y, obj_solid)
        {x+=sign(hspd)}
    hspd=0;
    }
    
x += hspd;

//Verticle collisions
if place_meeting(x, y+vspd, obj_solid)
    {
    while !place_meeting(x, y+sign(vspd), obj_solid)
        {y+=sign(vspd)}
    vspd=0;
    }
    
y += vspd;

if (instance_exists(obj_player))
    {state = scr_enemy_hostile;}

//Wrap the room
if (y > 800) && (vspd > 0)
    {y = -32;}
if (y < 0) && (vspd < 0)
    {y = 800}
if (x < -32) && (hspd < 0)
    {x = 1056;}
if (x > 1056) && (hspd > 0)
    {x = -32;}
    
//Control the enemy sprites
image_speed = .5
if (xprevious != x) && (yprevious = y)
    {sprite_index = spr_enemy_run}
if (yprevious != y)
    {
    sprite_index = spr_enemy_jump
    if (yprevious < y) {image_index = 1;}
        else {image_index = 0;}
    }
if (yprevious = y) && (xprevious = x)
    {sprite_index = spr_enemy_idle;}
    
//Control the direction
if (xprevious > x)
    {image_xscale = -1;}
if (xprevious < x)
    {image_xscale = 1;}
if (xprevious = x)
    {image_xscale = image_xscale;}
