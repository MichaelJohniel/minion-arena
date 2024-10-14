///scr_move_state

//Jump 
if place_meeting(x, y+1, obj_solid)
    {
    vspd = 0;
    grav = 1;
    djump = 1;
    if (jkey)
        {
        vspd = -jspd;
        audio_play_sound(snd_jump, 1, false);
        
        //S&S
        draw_yscale = 1.75;
        draw_xscale = .5;
        }
        
    //Mini boss bounce
    if (instance_exists(obj_mini))
        {
        if (obj_mini.land = 1)
            {vspd = -jspd/2;}
        }
    }
else
    {
    //Gravity
    if (vspd < 18)
        {vspd += grav;}
    grav += .01;
    
    //Controlled Jump
    if (keyboard_check_released(vk_up) && vspd < -4)
        {vspd = -4;}
    
    //double jump
    if (djump = 1) && (jkey)
        {
        djump = 0;
        vspd = -jspd;
         audio_play_sound(snd_jump, 1, false);
        }  
    }

//Move the player
if (lkey) 
    {
    if hspd != -spd
        {hspd -= accel;}
    if hspd <= -spd
        {hspd = -spd;}
    }
if (rkey) 
    {
    if hspd != spd
        {hspd += accel}
    if hspd >= spd
        {hspd = spd}
    }

//Stop Moving
if (!lkey && !rkey) || (lkey && rkey)
    {
    if hspd > 0 {hspd -= fric;}
    if hspd < 0 {hspd += fric;}
    }
    
//Turning dust
if (instance_place(x, y+1, obj_solid)) && !(hspd > spd) && !(hspd < -spd)
{
if (hspd < 0) && (rkey)
    {part_particles_create(global.ps,x-16,y,global.pt_dust,50);}
if (hspd > 0) && (lkey)
    {part_particles_create(global.ps,x+16,y,global.pt_dust,50);}
}

    
//Dash state
if (dakey) && !(jkey) && place_meeting(x, y+1, obj_solid) && (alarm[1] = -1)
    {
    if (rkey) || (image_xscale = 1)
        {hspd = 16;}
    if (lkey) || (image_xscale = -1)
        {hspd = -16;}
    state = scr_dash_state;
    audio_play_sound(snd_dash, 1, false);
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

//Return S&S
draw_xscale = lerp(draw_xscale, 1, .25);
draw_yscale = lerp(draw_yscale, 1, .25);

//Landing safe pause
if !(place_meeting(x, yprevious+1, obj_solid)) && (place_meeting(x, y+1, obj_solid)) && (alarm[1] = -1)
    {
    //Delay
    alarm[1] = 5;
    //S&S
    draw_yscale = .75;
    draw_xscale = 1.25;
    //Dirt
    part_particles_create(global.ps, x, y+10, global.pt_dirt, 15);
    }

//Wrap the room
if (obj_player.y > 800) && (vspd > 0)
    {obj_player.y = -32;}
if (obj_player.y < 0) && (vspd < 0)
    {obj_player.y = 800}
if (obj_player.x < -32) && (hspd < 0)
    {obj_player.x = 1056;}
if (obj_player.x > 1056) && (hspd > 0)
    {obj_player.x = -32;}
    
//Control the player sprites
image_speed = .5
if (xprevious != x) && (yprevious = y)
    {sprite_index = spr_player_run}
if (yprevious != y)
    {
    sprite_index = spr_player_jump
    if (yprevious < y) {image_index = 1;}
        else {image_index = 0;}
    }
if (yprevious = y) && (xprevious = x)
    {sprite_index = spr_player_idle;}
    
//Control the direction
if (xprevious > x)
    {image_xscale = -1;}
if (xprevious < x)
    {image_xscale = 1;}
if (xprevious = x)
    {image_xscale = image_xscale;}
