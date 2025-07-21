// -- Input Checks --
// Get keyboard input for menu navigation.
var _key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _key_select = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

// -- Navigate Menu --
// Move selection up
if (_key_up) {
    current_selection--;
    // If we go past the first option, loop around to the last one.
    if (current_selection < 0) {
        current_selection = menu_items_total - 1;
    }
    // Optional: Add a sound effect for navigation
    // audio_play_sound(snd_menu_move, 1, false);
}

// Move selection down
if (_key_down) {
    current_selection++;
    // If we go past the last option, loop around to the first one.
    if (current_selection >= menu_items_total) {
        current_selection = 0;
    }
    // Optional: Add a sound effect for navigation
    // audio_play_sound(snd_menu_move, 1, false);
}

// -- Select Option --
if (_key_select) {
    // Optional: Add a sound effect for selection
    // audio_play_sound(snd_menu_select, 1, false);

    // Use a switch statement to determine what to do based on the selection.
    switch (current_selection) {
        case 0: // START
            // This is where you would start the game.
            // For example: room_goto(rm_game_start);
			room_goto(Bedroom);
            show_debug_message("START selected");
            break;
        case 1: // OPTIONS
            // This would take you to an options screen.
            // For example: room_goto(rm_options);
            show_debug_message("OPTIONS selected");
            break;
        case 2: // QUIT
            // This closes the game.
            show_debug_message("QUIT selected");
            game_end();
            break;
    }
}

// -- Blinking Text Logic --
// Countdown the timer
blink_timer--;
if (blink_timer <= 0) {
    blink_timer = blink_timer_max; // Reset timer
    show_text = !show_text; // Flip the boolean
}