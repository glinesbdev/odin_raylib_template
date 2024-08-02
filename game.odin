package game

import rl "vendor:raylib"

/*
    This "accumulated_time" value is used to caculate a delta time "blend" value.

    The blend value is used at the end of a single update frame
    to check if objects are "close enough" to updating again before the next frame begins.

    The primary use case for this is to prevent stuttering of update calcuations for
    a smoother gaming experience.
*/
accumulated_time: f32

update :: proc() {
	accumulated_time += rl.GetFrameTime()

	for accumulated_time >= DELTA_TIME {

		accumulated_time -= DELTA_TIME
	}

	dt_blend := accumulated_time / DELTA_TIME
}

render :: proc() {
	rl.BeginDrawing()
	rl.ClearBackground(rl.BLACK)
	rl.DrawFPS(10, 10)

	rl.EndDrawing()
}

game_init :: proc() {
	rl.SetConfigFlags({.VSYNC_HINT})
	rl.InitWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Game")

	rl.SetTargetFPS(60)

	for !rl.WindowShouldClose() {
		update()
		render()
	}
}
