#region Inputs

inputUp = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_up);
inputUpHeld = keyboard_check(ord("Z")) || keyboard_check(vk_up);
inputDown = keyboard_check(ord("S")) || keyboard_check(vk_down);

#endregion

#region Inputs react

hdir = 1;
hmov = hdir * hspd;

if (vmov < 15) vmov += grav;

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

if (vmov < 0) && (!inputUpHeld) vmov = max(vmov,-vspd/4);

#endregion

#region Movement & Collsion

//Horizontal collisions
if(place_meeting(x+hmov,y,obj_collision))
{
	while(!place_meeting(x+sign(hmov),y,obj_collision))
	{
		x = x + sign(hmov)
	}
	hmov = 0;
}
x = x + hmov;

//Vertical collisions
if(place_meeting(x,y+vmov,obj_collision))
{
	while(!place_meeting(x,y+sign(vmov),obj_collision))
	{
		y = y + sign(vmov)
	}
	vmov = 0;
}
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