package FirstGame

import rl "vendor:raylib"


main :: proc() {

	rl.InitWindow(1200, 720, "My First Game")

	x: f32 = 600
	y: f32 = 360
	speed: f32 = 0.1

	min_frame_rate: int = 1
	max_frame_rate: int = 15

	mouse_position: rl.Vector2

	sprite: rl.Texture2D = rl.LoadTexture("sprite/Small-Default-Person.png")
	second_sprite: rl.Texture2D = rl.LoadTexture("sprite/textures_sprite_animation.png")

	currentFrame: int = 0
	frameCounter: int = 0
	frameSpeed: int = 8

	position: rl.Vector2 = {f32(350.0), f32(280.0)}

	sprite_frame: rl.Rectangle = {
		x      = f32(0.0),
		y      = f32(0.0),
		width  = f32(second_sprite.width / 6),
		height = f32(second_sprite.height),
	}

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {

		frameCounter += 1

		if (frameCounter >= 60 / frameSpeed) {
			frameCounter = 0
			currentFrame += 1

			if currentFrame > 5 {
				currentFrame = 0
			}

			sprite_frame.x = f32(currentFrame) * f32(second_sprite.width) / 6
		}

		rl.BeginDrawing()

		rl.ClearBackground(rl.BLACK)

		// rl.DrawRectangle(i32(x) - 20, i32(y) - 20, 40, 40, rl.RED)

		// rl.DrawCircle(i32(x), i32(y), 10, rl.RED)

		rl.DrawTexture(sprite, i32(x), i32(y), rl.WHITE)


		rl.DrawTextureRec(second_sprite, sprite_frame, position, rl.WHITE)


		if rl.IsKeyDown(rl.KeyboardKey.RIGHT) {
			x += speed
		}

		if rl.IsKeyDown(rl.KeyboardKey.LEFT) {
			x -= speed
		}

		if rl.IsKeyDown(rl.KeyboardKey.UP) {
			y -= speed
		}

		if rl.IsKeyDown(rl.KeyboardKey.DOWN) {
			y += speed
		}


		if rl.IsMouseButtonDown(rl.MouseButton.LEFT) {
			mouse_position = rl.GetMousePosition()

			x = mouse_position[0]
			y = mouse_position[1]
		}

		rl.EndDrawing()


	}

	rl.CloseWindow()

}
