kubectl logs -f -n monitoring \
  $(kubectl get pods -n monitoring | grep elasticsearch-master | sed -n 1p | awk '{print $1}') \
  | grep "Cluster health status changed from \[YELLOW\] to \[GREEN\]"