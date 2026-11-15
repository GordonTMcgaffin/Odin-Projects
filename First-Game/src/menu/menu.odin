package menu

import utils "../utilities"
import "core:fmt"
import rl "vendor:raylib"

PAUSE_MENU :: []cstring{"CONTINUE", "SETTINGS", "MAIN MENU", "QUIT"}
FONT_SIZE :: 45
PADDING :: 10


draw_pause_menu :: proc(game_settings: ^utils.GameSettings) -> string {

	mouse_pos := rl.GetMousePosition()
	mouse_clicked := rl.IsMouseButtonPressed(rl.MouseButton.LEFT)

	screen_width: i32 = rl.GetScreenWidth()
	screen_height: i32 = rl.GetScreenHeight()

	menu_height: i32 = i32(len(PAUSE_MENU)) * FONT_SIZE + i32(len(PAUSE_MENU)) * PADDING

	y_pos: i32 = (screen_height - menu_height) / 2

	for option in PAUSE_MENU {

		text_width := rl.MeasureText(option, FONT_SIZE)
		x_pos := (screen_width - text_width) / 2

		option_box := rl.Rectangle {
			x      = f32(x_pos),
			y      = f32(y_pos),
			width  = f32(text_width),
			height = f32(FONT_SIZE),
		}

		rl.DrawText(option, x_pos, y_pos, FONT_SIZE, rl.WHITE)
		y_pos = y_pos + FONT_SIZE + PADDING


		if rl.CheckCollisionPointRec(mouse_pos, option_box) {
			rl.DrawRectangleLinesEx(option_box, 2.0, rl.BLUE)

			if mouse_clicked {
				switch option {
				case "CONTINUE":
					return "GAME"
				case "SETTINGS":
					return "SETTINGS"
				case "QUIT":
					return "QUIT"
				case: // default

				}
			}
		}

	}

	return "MENU"


}

draw_settings_menu :: proc(game_settings: ^utils.GameSettings) -> string {

	input_box: rl.Rectangle = {
		x      = f32(game_settings.screen_width / 2),
		y      = f32(game_settings.screen_height / 2),
		width  = 400,
		height = FONT_SIZE*4,
	}

	if rl.CheckCollisionPointRec(rl.GetMousePosition(), input_box){
		rl.SetMouseCursor(rl.MouseCursor.IBEAM);

		key_pressed: rune = rl.GetCharPressed()

		

	}

	return "SETTINGS"

}
