/// @description bullet interaction with slime

with (other)
{
	hp -= 1;
	flash = 3;
	hitFrom = other.direction;
}

instance_destroy();
