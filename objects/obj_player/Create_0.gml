// Place this code in the Create Event of your player object.
// It initializes the variables needed for movement and animation.

// --- Movement Variables ---
walk_speed = 0.5; // How many pixels the player moves per frame. Adjust as needed.

// --- Animation State ---
// We'll use an enum to make the facing directions clear and easy to read.
// An enum assigns a number to each direction (e.g., DOWN=0, UP=1, etc.).
enum DIRECTION {
    DOWN,
    UP,
    LEFT,
    RIGHT
}
// Set the default facing direction when the game starts.
facing = DIRECTION.DOWN;