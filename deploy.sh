kubectl set image deployment/k8shtml-deployment k8shtml=alexsandr/k8s_html:latest
kubectl rollout restart deployment/k8shtml-deployment
