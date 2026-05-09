{ ... }:
{
    programs.kitty = {
        enable = true;
        font = {
            name = "JetBrainsMono Nerd Font Mono";
            size = 12;
        };
        settings = {
            # Font
            bold_font        = "auto";
            italic_font      = "auto";
            bold_italic_font = "auto";
            disable_ligatures = "always";
            text_composition_strategy = "1.7 0";

            # Window
            window_padding_width     = 4;
            hide_window_decorations  = "no";
            confirm_os_window_close  = 0;

            # Shell integration
            shell_integration = "enabled";
            mouse_map = "right press ungrabbed mouse_select_command_output";

            # Colors ayu dark
            foreground            = "#B8B5AC";
            background            = "#0B0E14";
            cursor                = "#FF8F40";
            cursor_text_color     = "#0B0E14";
            selection_foreground  = "#0B0E14";
            selection_background  = "#FF8F40";

            # Black
            color0 = "#0B0E14";
            color8 = "#3d4046";
            # Red
            color1 = "#F07178";
            color9 = "#F07178";
            # Green
            color2  = "#AAD94C";
            color10 = "#AAD94C";
            # Yellow
            color3  = "#E6C54C";
            color11 = "#FFEE99";
            # Blue
            color4  = "#59C2FF";
            color12 = "#59C2FF";
            # Magenta
            color5  = "#D2A6FF";
            color13 = "#D2A6FF";
            # Cyan
            color6  = "#39BAE6";
            color14 = "#80DDB8";
            # White
            color7  = "#B8B5AC";
            color15 = "#c9c7be";
        };

        keybindings = {
            "ctrl+shift+z" = "scroll_to_prompt -1";
            "ctrl+shift+x" = "scroll_to_prompt 1";
            "ctrl+shift+g" = "show_last_command_output";
        };
    };
}
