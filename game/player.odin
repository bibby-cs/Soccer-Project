package game

import rl "vendor:raylib"

Controller_Type :: enum {
    Human,
    AI,
}
keycontroller :: enum{
    up, 
    down,
    left, 
    right, 
    kick
}
Player :: struct {
    position:   rl.Vector2,
    velocity:   rl.Vector2,
    radius:     f32,
    speed:      f32,
    controller: Controller_Type,
}

update_player :: proc(player: ^Player, dt: f32) {
    if player.controller != .Human {
        return
    }

    direction := rl.Vector2{0, 0}
    
    if rl.IsKeyDown(.W) {
        direction.y -= 1
    }

    if rl.IsKeyDown(.S) {
        direction.y += 1
    }

    if rl.IsKeyDown(.A) {
        direction.x -= 1
    }

    if rl.IsKeyDown(.D) {
        direction.x += 1
    }

    if rl.Vector2Length(direction) > 0 {
        direction = rl.Vector2Normalize(direction)
    }

    player.velocity = rl.Vector2Scale(direction, player.speed)

    player.position = rl.Vector2Add(
        player.position,
        rl.Vector2Scale(player.velocity, dt),
    )
}

draw_player :: proc(player: ^Player) {
    color := rl.BLUE

    if player.controller == .AI {
        color = rl.RED
    }

    rl.DrawCircleV(player.position, player.radius, color)
}