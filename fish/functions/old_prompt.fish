function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

  # User
  set_color $fish_color_user
  echo -n (whoami)
  set_color normal

  echo -n '@'

  # Host
  set_color $fish_color_host
  echo -n (hostname -s)
  set_color normal

  if set -q VIRTUAL_ENV
    echo -n -s (set_color blue) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal)
  end

  echo -n ':'

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  __terlar_git_prompt
  echo

  if not test $last_status -eq 0
    set_color $fish_color_error
  end

  echo -n '➤ '
  set_color normal
end
