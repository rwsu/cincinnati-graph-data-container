# cincinnati-graph-data init container

cincinnati-graph-data-container is an init container that copies the Cincinnati graph data to a mounted volume (/tmp/cincinnati-graph-data).

## Using hostpath Persistent Volume for testing only

On worker nodes create /tmp/cincinnati-graph-data and apply SELinux labels.

```
mkdir /tmp/cincinnati-graph-data
sudo semanage fcontext -a -t svirt_sandbox_file_t '/tmp/cincinnati-graph-data(/.*)?'
sudo restorecon -RFv /tmp/cincinnati-graph-data
```

Create Persistent Volume

```
oc apply -f manifests/pv.yaml
```

Create Persistent Volume Claim

```
oc apply -f manifests/pvc.yaml
```

Deploy a test pod to verify graph data is copied to /tmp/cincinnati-graph-data.
```
oc apply -f manifests/pod.yaml
oc exec -ti init-graph-data-test /bin/sh 
ls /tmp/cincinnati-graph-data
```


