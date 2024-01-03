function kctx
    kubectl config set-context --current --namespace=$argv[1]
end

function kcfg
    export KUBECONFIG=$argv[1]
end


function knsvc
    kubectl $argv[1] ksvc $argv[2]
end

function kport
    kubectl port-forward $argv[1] $argv[2]
end
