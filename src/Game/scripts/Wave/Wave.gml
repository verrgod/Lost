// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Wave(_a, _b, _c, _d)
{
    argument0 = _a;
    argument1 = _b;
    argument2 = _c;
    argument3 = _d;
    var a4 = (_b - _a) * 0.5;
    return _a + a4 + sin((((current_time * 0.001) + _c * _d) / _c) * (pi*2)) * a4;
}