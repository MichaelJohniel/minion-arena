///scr_mini_hostile

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
    if (vspd < 20)
        {vspd += grav;}
    grav += .01;
    }

if instance_exists(obj_player)
{          
//Start Moving
if (distance_to_object(obj_player) < 900) && (alarm[1] = -1)
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
    ///jump towards player
    if (place_meeting(x, y+1, obj_solid))
        {
        if (canjump = 1)
            {vspd = -jspd; canjump = 0;}
        }

    }

    
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

//Attack
if (place_meeting(x, y+1, obj_solid)) && !(place_meeting(x, yprevious+1, obj_solid))
    {
    instance_create(x, y+55, obj_mini_hit);
    //Camera shake
    obj_camera.shake = 15;
    //Cooldown
    alarm[1] = 45;
    
    //Bounce
    land = 1;
    
    //Dirt
    part_particles_create(global.ps, x, y+55, global.pt_dirt, 35);
    part_particles_create(global.ps, x-20, y+55, global.pt_dirt, 35);
    part_particles_create(global.ps, x+20, y+55, global.pt_dirt, 35);
    }
if (place_meeting(x, y+1, obj_solid)) && (place_meeting(x, yprevious+1, obj_solid))  
    {land = 0;}

//Wrap the room
if (x < -68) && (hspd < 0)
    {x = 1088;}
if (x > 1088) && (hspd > 0)
    {x = -68;}
   
//Control the mini sprites
image_speed = .25
if (xprevious != x) && (yprevious = y)
    {sprite_index = spr_mini_run}
if (yprevious != y)
    {
    sprite_index = spr_mini_jump
    if (yprevious < y) {image_index = 1;}
        else {image_index = 0;}
    }
if (yprevious = y) && (xprevious = x)
    {sprite_index = spr_mini_idle;}
    
//Control the direction
if (xprevious > x)
    {image_xscale = -1;}
if (xprevious < x)
    {image_xscale = 1;}
if (xprevious = x)
    {image_xscale = image_xscale;}
