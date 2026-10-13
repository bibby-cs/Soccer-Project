package game

import rl "vendor:raylib"

Ball :: struct {
    position: rl.Vector2,
    velocity: rl.Vector2,
    radius:   f32,
}

update_ball :: proc(ball: ^Ball, dt: f32) {
    ball.position = rl.Vector2Add(
        ball.position,
        rl.Vector2Scale(ball.velocity, dt),
    )

    friction: f32 = 0.98

    ball.velocity = rl.Vector2Scale(
        ball.velocity,
        friction,
    )

    if rl.Vector2Length(ball.velocity) < 1 {
        ball.velocity = {0, 0}
    }
}

draw_ball :: proc(ball: ^Ball) {
    rl.DrawCircleV(ball.position, ball.radius, rl.WHITE)
}