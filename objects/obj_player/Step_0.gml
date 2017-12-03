#region Inputs

inputUp = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_up);
inputUpHeld = keyboard_check(ord("Z")) || keyboard_check(vk_up);
inputDown = keyboard_check(ord("S")) || keyboard_check(vk_down);

#endregion

#region Inputs react

if(!runOn) {
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

#region Damages

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

if(hHitted && hNewHit) {
	var loseOnHit = floor(money * 0.05);
	loss += loseOnHit;
	money -= loseOnHit;
	
	hNewHit = 0;
}

if(vHitted && vNewHit) {
	var loseOnHit = floor(money * 0.05);
	loss += loseOnHit;
	money -= loseOnHit;
	
	vNewHit = 0;
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