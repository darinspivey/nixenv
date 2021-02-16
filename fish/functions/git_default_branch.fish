function git_default_branch --description 'Returns "main" or "master" default branch'
  if git_project_name_env_var
    if test -n "$$ENV_VAR"
      echo $$ENV_VAR
      return 0
    end
  end

  if git ls-remote --exit-code --heads origin refs/heads/master > /dev/null
    set -g PROJECT_DEFAULT_BRANCH master
  else if git ls-remote --exit-code --heads origin refs/heads/main > /dev/null
    set -g PROJECT_DEFAULT_BRANCH main
  else
    echo 'Error: Failed to determine default branch. Is this a git project?'
    return 1
  end

  git_cache_default_branch

  echo $PROJECT_DEFAULT_BRANCH
end


function git_cache_default_branch --description 'Save the default branch value to an env var for speed'
  if test \( -n "$ENV_VAR" \) -a \( -n "$PROJECT_DEFAULT_BRANCH" \)
    set -gx $ENV_VAR $PROJECT_DEFAULT_BRANCH
    return 0
  else
    echo git_cache_default_branch could not cache the default branch value
    return 1
  end
end


function git_project_name_env_var --description 'Analyze the git origin URL to determine its project name'
  set -l name (git config remote.origin.url | sed 's/.*\///' | sed 's/\.git//')
  set -g ENV_VAR DEFAULT_BRANCH_(string upper $name | string replace -r -a '[^\\w]+' '_')

  if test -z "$ENV_VAR"
    # The name couldn't be found/parsed
    echo Error: Could not find project name based on the git URL.  Got name $name
    return 1
  end
end
