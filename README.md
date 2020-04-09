# cincinnati-graph-data init container

cincinnati-graph-data-container is an init container that copies the Cincinnati graph data to a mounted volume (/mnt/cincinnati-graph-data).

## Trying it out

Deploy a test pod to verify graph data is copied to /mnt/cincinnati-graph-data.

```
oc apply -f manifests/pod.yaml
oc exec -ti init-graph-data-test /bin/sh 
ls /mnt/cincinnati-graph-data
```


