function ldctx --description 'print or change the current logdna kubernetes context'
	set -l options 'h/help' 'c/current'
  argparse -n ldctx $options -- $argv
  or return
  if set -q _flag_help
    __fish_print_file_usage (status -f)
    return 0
  end
  if set -q _flag_current
    # Print the current context
    command cat "$LOGDNA_KUBE_CONFIG" | grep current-context | awk '{print $2}'
    return 0
  end
  if not set -q argv[1]
    command ls "$LOGDNA_WORKDIR" | egrep '^env-.*' | grep -v 'env-base'
    return 0
  end
  set -l context "$argv[1]"
  set -l list (command ls "$LOGDNA_WORKDIR" | egrep '^env-.*' | grep -v 'env-base')
  if not contains "$context" $list
    echo "invalid context: $context"
    return 1
  end
  echo "setting context: $context"
  set -Ux LOGDNA_KUBE_CONFIG "$LOGDNA_WORKDIR/$context/admin.conf"
  set -Ux KUBECONFIG "$LOGDNA_KUBE_CONFIG"
  set -l context_name (echo "$context" | string replace "env-" "")
  kubectx "$context_name"
end
