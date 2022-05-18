function client -d "client for spark 2.4.5"
    kubectl -n default exec -it deploy/kdl-client -- /usr/bin/env HADOOP_CONF_DIR=/etc/hadoop-custom-conf/ bash
end
