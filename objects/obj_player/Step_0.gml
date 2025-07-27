// Place this code in the Step Event of your player object.
// This code runs every single frame of the game.

// --- 1. Get Player Input ---
// Check which direction keys are being pressed. We use || (or) to allow
// both arrow keys and WASD for movement.
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

// --- 2. Calculate Movement Vector ---
// This creates a direction vector. (e.g., right is +1, left is -1).
var h_move = key_right - key_left;
var v_move = key_down - key_up;

// --- 3. Update Player Position ---
// Move the player object by the calculated vector and speed.
x += h_move * walk_speed;
y += v_move * walk_speed;

// --- 4. Manage Animation and Facing Direction ---
var is_moving = (h_move != 0 || v_move != 0);

if (is_moving) {
    // --- Player is MOVING ---
    
    // Update facing direction based on movement
    if (h_move > 0) {
        facing = DIRECTION.RIGHT;
    } else if (h_move < 0) {
        facing = DIRECTION.LEFT;
    } else if (v_move > 0) {
        facing = DIRECTION.DOWN;
    } else if (v_move < 0) {
        facing = DIRECTION.UP;
    }
    
    // Set the correct walking sprite based on the direction
    switch (facing) {
        case DIRECTION.DOWN:  sprite_index = spr_walk_down; break;
        case DIRECTION.UP:    sprite_index = spr_walk_up;   break;
        case DIRECTION.LEFT:  sprite_index = spr_walk_left;  break;
        case DIRECTION.RIGHT: sprite_index = spr_walk_right; break;
    }
    
    // Ensure the animation is playing
    image_speed = 1;

} else {
    // --- Player is IDLE ---
    
    // Stop the animation on the first frame for a static idle pose
    image_index = 0;
    image_speed = 0;
    
    // Set the correct idle sprite based on the last facing direction
    // UPDATED: Replaced asset_exists with try/catch to prevent crashing.
    switch (facing) {
        case DIRECTION.DOWN:
            try {
                sprite_index = spr_idle;
            } catch (_e) {
                show_debug_message("ERROR: Failed to assign 'spr_idle'. The asset does not exist or the name is misspelled. Please check the Asset Browser.");
            }
            break;
        case DIRECTION.UP:
            try {
                sprite_index = spr_idle_back;
            } catch (_e) {
                show_debug_message("ERROR: Failed to assign 'spr_idle_back'. Check asset name.");
            }
            break;
        case DIRECTION.LEFT:
            try {
                sprite_index = spr_idle_left;
            } catch (_e) {
                show_debug_message("ERROR: Failed to assign 'spr_idle_left'. Check asset name.");
            }
            break;
        case DIRECTION.RIGHT:
            try {
                sprite_index = spr_idle_right;
            } catch (_e) {
                show_debug_message("ERROR: Failed to assign 'spr_idle_right'. Check asset name.");
            }
            break;
    }
}