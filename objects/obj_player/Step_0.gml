#region Inputs

inputUp = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_up) || mouse_check_button_pressed(mb_left);
inputUpHeld = keyboard_check(ord("Z")) || keyboard_check(vk_up) || mouse_check_button(mb_left);
inputDown = keyboard_check(ord("S")) || keyboard_check(vk_down) || mouse_check_button(mb_right);

#endregion

#region Inputs react

if(runOn != 1) {
	inputUp = 0;
	inputUpHeld = 0;
	inputDown = 0;
}

hdir = 1;
hmov = hdir * hspd;

if (vmov < 100) vmov += grav;

#endregion

#region Jumps

if (place_meeting(x,y+1,obj_collision))
{
    jump = maxJump;
}
else
{
    if (jump == maxJump) jump -= 1;
}

if (inputUp) && (jump > 0)
{
    jump -= 1;
    vmov = -vspd;
}

if (vmov < 0) && (!inputUpHeld) vmov = max(vmov,-vspd/2);

#endregion

#region Collsions

//Horizontal collisions
if(place_meeting(x+hmov,y,obj_collision))
{
	while(!place_meeting(x+sign(hmov),y,obj_collision))
	{
		x = x + sign(hmov)
	}
	hmov = 0;
}

//Vertical collisions
if(place_meeting(x,y+vmov,obj_collision))
{
	while(!place_meeting(x,y+sign(vmov),obj_collision))
	{
		y = y + sign(vmov)
	}
	vmov = 0;
}

#endregion

#region Damage

//Horizontal damage
if(place_meeting(x+hmov,y,obj_damage))
{
	while(!place_meeting(x+sign(hmov),y,obj_damage))
	{
		x = x + sign(hmov)
	}
	hmov = 0;
	hHitted = 1;
}
else {
	hHitted = 0;
	hNewHit = 1;
}

if(hHitted && hNewHit) {
	wallHit += 1;
	money -= 10;
	hNewHit = 0;
}

//Vertical damage
if(place_meeting(x,y+vmov,obj_damage))
{
	while(!place_meeting(x,y+sign(vmov),obj_damage))
	{
		y = y + sign(vmov)
	}
	vmov = 0;
	vHitted = 1;
}
else {
	vHitted = 0;
	vNewHit = 1;
}

if(vHitted && vNewHit) {
	wallHit += 1;
	money -= 10;
	vNewHit = 0;
}

//Fall
if(place_meeting(x,y,obj_death))
{
	fallHit += 1;
	money -= 250;
	
	var nearestCP = instance_nearest(x,y,obj_checkpoint);
	x = nearestCP.x;
	y = nearestCP.y;
}

#endregion

#region Tax

if(money>=6000) { 
	tax = 50 + floor((money-6000)/100);
	guiRed = 255;
}
if(money<6000) {
	tax = 25;
	guiRed = 127;
}
if(money<5000) {
	tax = 12;
	guiRed = 63;
}
if(money<4000) {
	tax = 10;
	guiRed = 31;
}
if(money<3000) {
	tax = 8;
	guiRed = 15;
}
if(money<2000) {
	tax = 6;
	guiRed = 7;
}
if(money<1000) {
	tax = 5;
	guiRed = 3;
}

#endregion

#region Movement

x += hmov;
y += vmov;

#endregion

#region Sprites

if(inputDown) {
	y -= 1;
	sprite_index = spr_player_slide;
}
else {
	sprite_index = spr_player_run;
}

#endregion