function fish_prompt
  # Cache exit status
  set -l last_status $status

  # set any current K_POD info
  if test $K_SHORT_NAME
    set -g k_short "(pod: $K_SHORT_NAME)"
  else
    set -g k_short ''
  end

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
  set -g __fish_prompt_char '#'
      case '*'
  set -g __fish_prompt_char 'λ'
    end
  end

  set -l NODE "("(node -v)")"

  # Setup colors
  set -l normal (set_color normal)
  set -l white (set_color FFFFFF)
  set -l turquoise (set_color 5fdfff)
  set -l orange (set_color df5f00)
  set -l hotpink (set_color df005f)
  set -l blue (set_color blue)
  set -l limegreen (set_color 87ff00)
  set -l purple (set_color af5fff)
  set -l cyan (set_color brcyan)
  set -l magenta (set_color brmagenta)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator ' '
  set -g __fish_git_prompt_color brmagenta
  set -g __fish_git_prompt_color_flags 87ff00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_showuntrackedfiles true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true 

  # Line 1
  echo -n $white' ╭─' $orange$NODE$white' in '$turquoise(pwd)
  __fish_git_prompt " (%s)"
  echo

  # Line 2
  echo -n $magenta$k_short(fish_mode_prompt | tr -d \\n)$white $__fish_prompt_char' ➜ '$normal
end


