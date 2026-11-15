package utilities


import "core:encoding/json"
import "core:fmt"
import "core:os"
import "core:path/filepath"
import rl "vendor:raylib"


GameSettings :: struct {
	screen_width:  i32,
	screen_height: i32,
	fullscreen:    bool,
}

GAME_PATH :: "~/.local/share/My-First-Game"


load_game_context :: proc() -> GameSettings {

	fmt.println("Loading game config . . . ")
	home := os.get_env_alloc("HOME", context.allocator)
	config_dir, config_dir_err := filepath.join(
		{home, ".local", "share", "My-First-Game", "config"},
	)
	config_file, config_file_err := filepath.join({config_dir, "config.json"})

	defer delete(config_file)
	defer delete(home)
	defer delete(config_dir)


	json_data, err := os.read_entire_file(config_file, context.allocator)

	if err == os.General_Error.Not_Exist {
		fmt.println("File not found. Loading default settings.")
		fmt.printfln("Creating file at: %s", config_file)


		copy_error := os.copy_file(config_file, "./resources/defaults/config.json")

		if copy_error != nil {
			fmt.println("I got the following error: ")
			fmt.println(copy_error)
		}

		json_data, err = os.read_entire_file(config_file, context.allocator)
	}

	game_context: GameSettings


	load_error := json.unmarshal(json_data, &game_context)

	fmt.println("Loaded the following game config: ")
	fmt.println(game_context)

	rl.InitWindow(game_context.screen_width, game_context.screen_height, "My-First-Game")
	if game_context.fullscreen {
		rl.ToggleFullscreen()
	}

	return game_context
}
