///scr_giant_hostile

//Jump 
if place_meeting(x, y+1, obj_solid)
    {
    vspd = 0;
    grav = 1;
    djump = 1;
    canjump = 1;
    }
else
    {
    //Gravity
    if (vspd < 15)
        {vspd += grav;}
    grav += .01;
    }

if instance_exists(obj_player)
{          
//Start Moving
if ((distance_to_object(obj_player) > 150) || (distance_to_object(obj_player) < 150))
    {
    //turn right
    if ((obj_player.x) > x) && (image_xscale = -1)
        {image_xscale = 1}
    //turn left
    if ((obj_player.x) < x) && (image_xscale = 1)
        {image_xscale = -1}
    //move left
    if !(place_meeting(x-1, y, obj_solid)) && !(place_meeting(x-1, y, obj_player)) && (image_xscale = -1)
        {
        if hspd != -spd
            {hspd -= accel;}
        if hspd <= -spd
            {hspd = -spd;}
        }
    //move right
    if !(place_meeting(x+1, y, obj_solid)) && !(place_meeting(x+1, y, obj_player)) && (image_xscale = 1) 
        {
        if hspd != spd
            {hspd += accel}
        if hspd >= spd
            {hspd = spd}
        }

    }
    
//Attack
if (distance_to_object(obj_player) < 14) && (attack = 1) && (alarm[1] = -1)
    {
    alarm[1] = 5;
    }

//Rest the attack
if (attack = 0) {if (alarm[0] = -1) {alarm[0] = (round(random_range(10,15)));}}
       
//Stop Moving
if (place_meeting(x+14, y, obj_player)) || (place_meeting(x-14, y, obj_player))
    {
    if hspd > 0 {hspd -= fric;}
    if hspd < 0 {hspd += fric;}
    }  

    
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

}

//Wrap the room
if (y > 832) && (vspd > 0)
    {y = -68;}
if (y < 0) && (vspd < 0)
    {y = 832}
if (x < -68) && (hspd < 0)
    {x = 1088;}
if (x > 1088) && (hspd > 0)
    {x = -68;}
   
//Control the giant sprites
image_speed = .25
if (xprevious != x) && (yprevious = y)
    {sprite_index = spr_giant_run}
if (yprevious != y)
    {
    sprite_index = spr_giant_jump
    if (yprevious < y) {image_index = 1;}
        else {image_index = 0;}
    }
if (yprevious = y) && (xprevious = x)
    {sprite_index = spr_giant_idle;}
    
//Control the direction
if (xprevious > x)
    {image_xscale = -1;}
if (xprevious < x)
    {image_xscale = 1;}
if (xprevious = x)
    {image_xscale = image_xscale;}
