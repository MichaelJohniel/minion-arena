///scr_controller
//Windows
lkey = (keyboard_check(vk_left)) || (gamepad_button_check(0, gp_padl));
rkey = (keyboard_check(vk_right)) || (gamepad_button_check(0, gp_padr));
ukey = (keyboard_check_pressed(vk_up)) || (gamepad_button_check_pressed(0, gp_padu));
jkey = (keyboard_check_pressed(vk_up)) || (gamepad_button_check_pressed(0, gp_face1));
skey = (keyboard_check(vk_space)) || (gamepad_button_check_pressed(0, gp_face1));
dkey = (keyboard_check(vk_down)) || (gamepad_button_check(0, gp_padd));
dakey = (keyboard_check_pressed(ord('X'))) || (gamepad_button_check_pressed(0, gp_face2));
akey = (keyboard_check_pressed(ord('Z'))) || (gamepad_button_check_pressed(0, gp_face3));

