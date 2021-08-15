/// @description trigger area for dialogue

var _text;

if (!triggered)
{
	_text = self.textToShow;
	
	with (obj_player)
	{
		// create textbox
		if (!instance_exists(obj_textBox) && hasControl)
		{
			textBox = instance_create_depth(x + 200 , y - 200, -10000, obj_textBox);
			textBox.textToShow = _text;
		}
	}
	triggered = true;
} 
