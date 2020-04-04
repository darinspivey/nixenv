function pretty_commits -d 'Pretty print commits for a pull request'
  set -l current_branch (git rev-parse --abbrev-ref HEAD | tr -d '\n')
  set -l commits (git log master.."$current_branch" --pretty='%h' \
      #| sed -e '$ d' \
      | wc -l \
      | awk '{print $1}'
  )
  git log --pretty='**%s**%n%n%b%n---%n' -n $commits
end
