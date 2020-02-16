function __kubedash_open
    sleep 2
    set -l url "http://localhost:8001/api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy/"
    echo "Kubernetes Dashboard available at: $url"
    open $url
end

function kubedash --description 'Open Kubernetes Dashboard in current context.'
    __kubedash_open &
    kubectl proxy
end
