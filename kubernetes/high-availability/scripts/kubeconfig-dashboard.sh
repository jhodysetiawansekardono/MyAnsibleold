server=https://k8s-api.beruanglaut.cloud:8443
name=admin-user
ca=$(kubectl -n kubernetes-dashboard get secret/$name -o jsonpath='{.data.ca\.crt}')
token=$(kubectl -n kubernetes-dashboard get secret/$name -o jsonpath='{.data.token}' | base64 --decode)

echo "
apiVersion: v1
kind: Config
clusters:
- name: kubernetes
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: admin@kubernetes
  context:
    cluster: kubernetes
    user: admin
current-context: admin@kubernetes
users:
- name: admin
  user:
    token: ${token}
" > /tmp/user-k8s-dashboard.yaml
