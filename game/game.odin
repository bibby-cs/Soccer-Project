package game

import rl "vendor:raylib"

Game_State :: struct {
    players: [2]Player,
    ball:    Ball,
    field:   Field,

    score: [2]int,
}

init_game :: proc() -> Game_State {
    state: Game_State

    state.field = init_field()

    state.players[0] = Player{
        position = {300, 325},
        velocity = {0, 0},
        radius = 18,
        speed = 250,
        controller = .Human,
    }

    state.players[1] = Player{
        position = {700, 325},
        velocity = {0, 0},
        radius = 18,
        speed = 250,
        controller = .AI,
    }

    state.ball = Ball{
        position = {500, 325},
        velocity = {0, 0},
        radius = 10,
    }

    return state
}

update_game :: proc(state: ^Game_State, dt: f32) {
    for i in 0..<len(state.players) {
        update_player(&state.players[i], dt)

        clamp_player_to_field(
            &state.players[i],
            &state.field,
        )
    }
    update_ball(&state.ball, dt)
}

draw_game :: proc(state: ^Game_State) {
    draw_field(&state.field)

    for i in 0..<len(state.players) {
        draw_player(&state.players[i])
    }

    draw_ball(&state.ball)

    rl.DrawText("Odin Soccer", 20, 15, 24, rl.WHITE)
}