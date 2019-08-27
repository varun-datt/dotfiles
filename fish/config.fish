begin
  set --local AUTOJUMP_PATH /usr/local/bin/autojump.fish
  if test -e $AUTOJUMP_PATH
    source $AUTOJUMP_PATH
  end
end

set -gx NVM_DIR '/usr/local/opt/nvm'
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
set -x VISUAL nvim
set -x EDITOR "$VISUAL"
set -g fish_user_paths '/Users/varun.datt/sandbox/github/dotfiles/macos/bin" $fish_user_paths