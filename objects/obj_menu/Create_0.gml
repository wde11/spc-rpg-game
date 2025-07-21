menu_options = [
"START",
"OPTIONS",
"QUIT",
]

menu_items_total = array_length(menu_options);

current_selection = 0;
heart_sprite = spr_heart;

show_text = true; 
blink_timer_max = 15;
blink_timer = blink_timer_max;