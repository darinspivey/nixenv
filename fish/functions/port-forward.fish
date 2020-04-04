function port-forward --description 'Forward a deployment by name'
    set -l options 'h/help'
  argparse -n port-forward $options -- $argv
  or return

  if set -q _flag_help
    __port_forward_help
    return 0
  end

  if not set -q argv[1]
    __port_forward_help
    return 1
  end

  set -l name $argv[1]
  set -l port (command kubectl get deploy "$name" \
    -o custom-columns='PORT:.spec.template.spec.containers[0].ports[0].containerPort' \
    --no-headers)

  set -l pods (command kubectl get pods --no-headers \
    -l name="$name" \
    -o custom-columns='.NAME:.metadata.name')

  set -l pod (random choice $pods)
  echo "forwarding $port to $pod"
  kubectl port-forward "$pod" $port:$port
end
