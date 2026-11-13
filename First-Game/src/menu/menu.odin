package menu

import rl "vendor:raylib"


draw_menu :: proc() {


	// for !rl.IsKeyPressed(rl.KeyboardKey.ESCAPE) || !rl.WindowShouldClose() {

	screen_width: i32 = rl.GetScreenWidth()
	screen_height: i32 = rl.GetScreenHeight()

	rl.DrawText(
		"MY ODIN GAME",
		(screen_width - rl.MeasureText("MY ODIN GAME", 45)) / 2,
		(screen_height / 2 - 5),
		45,
		rl.WHITE,
	)


	// }


}
