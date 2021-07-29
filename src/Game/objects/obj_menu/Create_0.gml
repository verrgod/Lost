/// @description GUI/Vars/Menu setup

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width; // + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 25; //lower = faster
menu_font = font_menu;
menu_itemHeight = font_get_size(font_menu);
menu_committed = -1;
menu_control = true;

menu[2] = "Start Game";
menu[1] = "Continue Game";
menu[0] = "Exit";

menu_items = array_length_1d(menu);
menu_cursor = 2;