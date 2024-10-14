///scr_enemy_hostile

//Jump 
if place_meeting(x, y+1, obj_solid)
    {
    vspd = 0;
    grav = 1;
    djump = 1;
    canjump = 1;
    //Mini boss bounce
    if (instance_exists(obj_mini))
        {
        if (obj_mini.land = 1)
            {vspd = -jspd/4;}
        }
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
if (distance_to_object(obj_player) < 900)
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
        //jump with player
        if (obj_player.y < y) && (obj_player.vspd < 0) && (distance_to_object(obj_player) < 15) && (canjump = 1)
            {vspd = -jspd; canjump = 0;}
        //jump onto ledge with player to the right
        if (obj_player.y < y) && (place_meeting(x+1, y, obj_solid)) && (canjump = 1)
            {vspd = -jspd; canjump = 0;}
        //jump onto ledge with player to the left
        if (obj_player.y < y) && (place_meeting(x-1, y, obj_solid)) && (canjump = 1)
            {vspd = -jspd; canjump = 0;}
        }
    if (distance_to_object(obj_player) < 50)
        {
        //Jump towards the player while in air
        if !(place_meeting(x, y+1, obj_solid)) && (canjump = 1) && (vspd > 0) && (obj_player.y < y)
            {vspd = -jspd; canjump = 0;}
        //double jump to the player
        if !(place_meeting(x, y+1, obj_solid)) && (djump = 1) && (canjump = 0) && (vspd > 0) && (obj_player.y < y)
            {vspd = -jspd; djump = 0;}
        }
    }
    
//Attack
if (distance_to_object(obj_player) < 7) && (attack = 1) && (alarm[1] = -1)
    {
    alarm[1] = 5;
    }

//Rest the attack
if (attack = 0) {if (alarm[0] = -1) {alarm[0] = (round(random_range(5,7)));}}
       
//Stop Moving
if (place_meeting(x+7, y, obj_player)) || (place_meeting(x-7, y, obj_player))
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

if !(instance_exists(obj_player))
    {state = scr_enemy_passive;}

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
