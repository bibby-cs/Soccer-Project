package game

import rl "vendor:raylib"

Field :: struct {
    bounds:      rl.Rectangle,
    goal_height: f32,
}

init_field :: proc() -> Field {
    return Field{
        bounds = {50, 75, 900, 500},
        goal_height = 140,
    }
}

draw_field :: proc(field: ^Field) {
    bounds := field.bounds

    rl.DrawRectangleLinesEx(bounds, 3, rl.WHITE)

    // Center line
    center_x := bounds.x + bounds.width / 2
    center_y := bounds.y + bounds.height / 2

    rl.DrawLineEx(
        {center_x, bounds.y},
        {center_x, bounds.y + bounds.height},
        2,
        rl.WHITE,
    )

    // Center circle
    rl.DrawCircleLines(
        i32(center_x),
        i32(center_y),
        65,
        rl.WHITE,
    )

    // Goals
    goal_top := center_y - field.goal_height / 2

    rl.DrawRectangleLinesEx(
        {-10 + bounds.x, goal_top, 10, field.goal_height},
        2,
        rl.WHITE,
    )

    rl.DrawRectangleLinesEx(
        {bounds.x + bounds.width, goal_top, 10, field.goal_height},
        2,
        rl.WHITE,
    )
}