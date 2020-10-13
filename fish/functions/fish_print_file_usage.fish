# This is adapted from https://github.com/fish-shell/fish-shell/issues/540#issuecomment-239155879
# to parse the calling script file for a usage block.
function fish_print_file_usage --arg filepath
  set print -1
  for line in (cat "$filepath")
    if test (echo $line | egrep '(### usage|###)')
      set print (math "$print*-1")
    else if test $print -eq 1
      echo $line | sed -E 's/^..?//'
    end
  end
end

