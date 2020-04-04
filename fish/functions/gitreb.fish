function gitreb -d 'stash, checkout branch, pull, and rebase'
  set -l branch (command git rev-parse --abbrev-ref HEAD ^/dev/null)
  test -n "$branch"; or return
  printf "stashing %s[%s%s%s]%s\n" \
    (set_color 005fd7) \
    (set_color ff5fff) \
    "$branch" \
    (set_color 005fd7) \
    (set_color normal)

  git stash

  set -l newbr "master"
  set -l remote "upstream"
  switch (count $argv)
    case 1
      set newbr $argv[1]
    case 2
      set newbr $argv[1]
      set remote $argv[2]
  end

  printf "checking out %s[%s%s%s]%s\n" \
    (set_color 005fd7) \
    (set_color ff5fff) \
    "$newbr" \
    (set_color 005fd7) \
    (set_color normal)

  git checkout "$newbr"

  printf "pulling %s[%s%s%s]%s\n" \
    (set_color 005fd7) \
    (set_color ff5fff) \
    "$newbr" \
    (set_color 005fd7) \
    (set_color normal)

  git pull -r "$remote" "$newbr"

  if test $status -ne 0
    git rebase --abort
    git checkout "$branch"
    return 1
  end

  git checkout "$branch"
  git rebase "$newbr"
end
