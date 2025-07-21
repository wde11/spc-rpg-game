
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var move_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var move_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var move_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

horizontal_speed = (move_right - move_left) * move_speed;
vertical_speed = (move_down - move_up) * move_speed;

x += horizontal_speed;
y += vertical_speed;

// --- Horizontal Collision ---
// Check if a wall is in the way of our horizontal movement
if (place_meeting(x + horizontal_speed, y, obj_wall))
{
    // If so, move pixel by pixel until we are right next to the wall
    while (!place_meeting(x + sign(horizontal_speed), y, obj_wall))
    {
        x += sign(horizontal_speed);
    }
    // Stop all horizontal movement
    horizontal_speed = 0;
}
// Apply the final horizontal movement
x += horizontal_speed;


// --- Vertical Collision ---
// Check if a wall is in the way of our vertical movement
if (place_meeting(x, y + vertical_speed, obj_wall))
{
    // If so, move pixel by pixel until we are right next to the wall
    while (!place_meeting(x, y + sign(vertical_speed), obj_wall))
    {
        y += sign(vertical_speed);
    }
    // Stop all vertical movement
    vertical_speed = 0;
}
// Apply the final vertical movement
y += vertical_speed;
