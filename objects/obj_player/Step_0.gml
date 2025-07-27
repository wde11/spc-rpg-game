
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var move_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var move_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
var move_down = keyboard_check(vk_down) || keyboard_check(ord("S"));

horizontal_speed = (move_right - move_left) * move_speed;
vertical_speed = (move_down - move_up) * move_speed;

x += horizontal_speed;
y += vertical_speed;
