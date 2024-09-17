# httpd
HTTPD container as non-privileged and works with PV

```bash
oc create -f httpd-pvc.yaml
oc create -f httpd-deployment.yaml
```
Create a route:
```bash
$ oc expose deployment.apps/httpd --port 8080
service/httpd exposed
$ oc expose svc httpd
route.route.openshift.io/httpd exposed
```

Test route:
curl http://httpd-httpd.apps.sno1.local.momolab.io/
