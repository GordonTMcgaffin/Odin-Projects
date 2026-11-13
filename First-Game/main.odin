package Game

import "core:fmt"
import "src/menu"
import rl "vendor:raylib"

main :: proc() {


	rl.InitWindow(1200, 720, "My First Game")
	defer rl.CloseWindow()
	// rl.ToggleFullscreen()

	state: string = "GAME"

	rl.SetExitKey(.KEY_NULL)

	for (!rl.WindowShouldClose()) {
		rl.BeginDrawing()
		rl.ClearBackground(rl.DARKGRAY)

		if state == "MENU" {
			menu.draw_menu()
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
