kubectl exec $(kubectl get pods -n monitoring | grep elasticsearch-client | sed -n 1p | awk '{print $1}') \
    -n monitoring \
    -- bin/elasticsearch-setup-passwords auto -b


    #kubectl create secret generic elasticsearch-pw-elastic \
    #-n monitoring \
    #--from-literal password=3JW4tPdspoUHzQsfQyAI