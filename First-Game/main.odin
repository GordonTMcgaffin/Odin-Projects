package Game

import "core:fmt"
import "src/menu"
import rl "vendor:raylib"

import "src/utilities"

main :: proc() {

	game_settings: utilities.GameSettings = utilities.load_game_context()

	defer rl.CloseWindow()
	// rl.ToggleFullscreen()

	state: string = "GAME"

	rl.SetExitKey(.KEY_NULL)

	for (!rl.WindowShouldClose()) {
		rl.BeginDrawing()
		rl.ClearBackground(rl.DARKGRAY)

		if state == "MENU" {
			state = menu.draw_pause_menu(&game_settings)

			if state == "QUIT" {
				break
			}
		}

		if state == "SETTINGS" {
			state = menu.draw_settings_menu(&game_settings)

			if state == "QUIT" {
				break
			}
		}


		if rl.IsKeyPressed(rl.KeyboardKey.ESCAPE) {
			if state == "MENU" {
				state = "GAME"
			} else {
				state = "MENU"
			}
		}

		if rl.IsKeyPressed(rl.KeyboardKey.F) {
			rl.ToggleFullscreen()
		}


		// screen_width: i32 = rl.GetScreenWidth()
		// screen_height: i32 = rl.GetScreenHeight()

		// rl.DrawText("MY ODIN GAME", screen_width / 2, screen_height / 2, 45, rl.WHITE)

		rl.EndDrawing()


	}


	fmt.println((!rl.WindowShouldClose() && !rl.IsKeyPressed(rl.KeyboardKey.ESCAPE)))

}
