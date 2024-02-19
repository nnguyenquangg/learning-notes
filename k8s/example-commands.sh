kubectl -n lumen-dev exec --stdin --tty lumen-backend-dev-backend-79cb76949d-9mczf sh
kubectl -n lumen-dev logs -f lumen-backend-dev-backend-79cb76949d-9mczf
kubectl -n lumen-dev get pods
kubectl -n lumen-dev describe pods/trustesg-backend-dev-backend-547975f84b-j9nxm
kubectl -n staging scale deployments/backend --replicas=1
kubectl -n trustesg-hodford-dev rollout history esg-frontend-dev-monochartg
kubectl -n trustesg-hodford-dev rollout history deployments/esg-frontend-dev-monochart --revision=100
kubectl -n framework-builder-uat port-forward  framework-builder-infra-uat-postgresql-0 5432:5432