{ pkgs, username, dotfiles, ... }: {

  programs.fish.enable = true;
  hjem.users.${username} = {
    packages = with pkgs.fishPlugins; [ bass autopair sponge ];

    xdg.config.files."fish/config.fish".text = ''
      if status is-interactive
        set fish_greeting

        starship init fish | source

        alias cls clear
        alias ff fastfetch

        alias cat "bat --style=changes,numbers --paging=never"
        alias grep "grep --color=auto"
        alias tree "eza --tree --icons --git-ignore --group-directories-first"

        alias ls "eza --icons=auto --group-directories-first"
        alias la "eza -la --icons=auto --group-directories-first --git"
        alias lc "eza --code"

        alias .. "cd .."
        alias ... "cd ../.."

        alias cd-nix "cd /etc/nixos"
        alias cd-hjem "cd /etc/nixos/users"
        alias cd-noctalia "cd ${dotfiles}/noctalia"
        alias cd-umbriel "cd ${dotfiles}/umbriel"
        alias cd-wpapers "cd ${dotfiles}/wallpapers"

        alias ncl "nh clean all --keep 5"
        alias nco "nix-store --optimize -vv"
        alias ns "nh search"
        alias nsh "nix-shell -p"

        alias flu "sudo nix flake update --flake /etc/nixos"
        alias flc "sudo nix flake check /etc/nixos"

        alias rs "nh os switch"
        alias rl "nixos-rebuild list-generations"

        function command_newline --on-event fish_preexec --on-event fish_postexec
          contains $argv clear cls; or echo
        end
      end
    '';
  };
}

