// ## 1. Input & Speed
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var move_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var move_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var move_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

var horizontal_speed = (move_right - move_left) * move_speed;
var vertical_speed = (move_down - move_up) * move_speed;


// ## 2. Update Animation and Direction
if (horizontal_speed != 0) // Moving horizontally
{
    is_facing_up = false;
    if (horizontal_speed > 0)
    {
        // FIX: Using your actual sprite name for walking right
        sprite_index = spr_walk_right_up;
    }
    else
    {
        // FIX: Using your actual sprite name for walking left
        sprite_index = spr_walk_left_up;
    }
}
else if (vertical_speed != 0) // Moving vertically
{
    if (vertical_speed > 0)
    {
        is_facing_up = false;
        // FIX: Using your other right-walk sprite for walking down.
        // You should create a dedicated down-walking animation later.
        sprite_index = spr_walk_right_down;
    }
    else
    {
        is_facing_up = true;
        // FIX: Using your other left-walk sprite for walking up.
        // You should create a dedicated up-walking animation later.
        sprite_index = spr_walk_left_down;
    }
}
else // Not moving (Idle)
{
    if (is_facing_up == true)
    {
        sprite_index = spr_idle_back;
    }
    else
    {
        sprite_index = spr_main;
    }
}


// ## 3. Update Position
x += horizontal_speed;
y += vertical_speed;