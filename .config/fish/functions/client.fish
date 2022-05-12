function client -d "client for spark 2.4.5"
    kubectl -n default exec -it deploy/kdl-client -- bash "$argv"
end
