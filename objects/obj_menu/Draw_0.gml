// =============================================================================
// DRAW EVENT for obj_menu
//
// This event also runs every frame, after the Step event.
// We use it to draw the menu text and heart cursor to the screen.
// =============================================================================

// -- Set Drawing Properties --
// Set the font and alignment for our menu text.
// Make sure you have a font named 'fnt_menu' or change this.
draw_set_font(Font1);
draw_set_halign(fa_center); // Horizontal alignment
draw_set_valign(fa_top);    // Vertical alignment
draw_set_color(c_white);    // Set text color to white

// -- Draw Title --
// You can draw your game's title here.
// We get the middle of the room to center the text.
var _room_mid_x = room_width / 2;
draw_text(_room_mid_x, 64, "Game");


// -- Draw Menu Options --
// Loop through all the menu options and draw them.
for (var i = 0; i < menu_items_total; i++) {
    // The starting vertical position for the menu list.
    var _menu_y_start = 180;
    // The vertical space between each menu item.
    var _menu_item_gap = 40;
    // Calculate the y position for this specific item.
    var _item_y_pos = _menu_y_start + (i * _menu_item_gap);

    // Check if this is the currently selected item
    if (i == current_selection) {
        // --- This is the selected item ---

        // Draw the heart cursor to the left of the text.
        // We calculate its position based on the text position.
        var _text_width = string_width(menu_options[i]);
        var _heart_x_pos = _room_mid_x - (_text_width / 2) - 30;
        draw_sprite(heart_sprite, 0, _heart_x_pos, _item_y_pos + 8);

        // Draw the text, but only if the blink timer allows it.
        if (show_text) {
            draw_text(_room_mid_x, _item_y_pos, menu_options[i]);
        }

    } else {
        // --- This is NOT the selected item ---
        // Just draw the text normally.
        draw_text(_room_mid_x, _item_y_pos, menu_options[i]);
    }
}

// -- Reset Draw Properties --
// It's good practice to reset alignment after you're done.
draw_set_halign(fa_left);
draw_set_valign(fa_top);