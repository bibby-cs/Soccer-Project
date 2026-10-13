package main

import rl "vendor:raylib"
import "./game"

main :: proc() {
    rl.InitWindow(1000, 650, "Odin Soccer")
    defer rl.CloseWindow()

    rl.SetTargetFPS(60)

    state := game.init_game()

    for !rl.WindowShouldClose() {
        dt := rl.GetFrameTime()

        game.update_game(&state, dt)

        rl.BeginDrawing()
        rl.ClearBackground(rl.DARKGREEN)

        game.draw_game(&state)

        rl.EndDrawing()
    }
}