function auth_ibm_clusters --description 'Setup ibm k8s clusters and rename the contexts'
  set -l clusters (ibmcloud ks clusters --json | jq -r '.[] | [.id, .name] | @tsv' )
  for cluster in $clusters
    set -l id (echo "$cluster" | awk '{print $1}')
    set -l name (echo "$cluster" | awk '{print $2}')
    echo "id: $id"
    echo "name: $name"
    ibmcloud ks cluster config --cluster "$id"
    kubectx "$name"="$name/$id"
  end
end

