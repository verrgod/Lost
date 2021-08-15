/// @description destroy textbox

// destroy me
with (obj_player)
{
	hasControl = true;
	gravSpeed = 0.5;
}
with (obj_dialogue) inDialogue = false;
instance_destroy();
