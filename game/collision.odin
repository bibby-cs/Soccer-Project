package game

import rl "vendor:raylib"

clamp_player_to_field :: proc(player: ^Player, field: ^Field) {
    bounds := field.bounds

    player.position.x = rl.Clamp(
        player.position.x,
        bounds.x + player.radius,
        bounds.x + bounds.width - player.radius,
    )

    player.position.y = rl.Clamp(
        player.position.y,
        bounds.y + player.radius,
        bounds.y + bounds.height - player.radius,
    )
}