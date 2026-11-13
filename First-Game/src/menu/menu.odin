package menu

import rl "vendor:raylib"

PAUSE_MENU := []cstring{"CONTINUE", "SETTINGS", "MAIN MENU", "QUITE"}
FONT_SIZE: i32 = 45
PADDING: i32 = 10


draw_menu :: proc() {


	// for !rl.IsKeyPressed(rl.KeyboardKey.ESCAPE) || !rl.WindowShouldClose() {

	screen_width: i32 = rl.GetScreenWidth()
	screen_height: i32 = rl.GetScreenHeight()

	menu_height: i32 = i32(len(PAUSE_MENU)) * FONT_SIZE + i32(len(PAUSE_MENU)) * PADDING

	y_pos: i32 = (screen_height - menu_height) / 2

	for option in PAUSE_MENU {
		rl.DrawText(option, (screen_width - rl.MeasureText(option, 45)) / 2, y_pos, 45, rl.WHITE)
		y_pos = y_pos + FONT_SIZE + PADDING

	}

	


	// }


}
