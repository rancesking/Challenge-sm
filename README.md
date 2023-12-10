# DevOps Test

Esta es mi implementación de la aplicación demo para la prueba de DevOps.

## Diseño de infraestructura en AWS

![Diagrama de Infraestructura](https://i.ibb.co/PFhw5Bf/Simetrik-Dev-Ops-Test-Racosta.jpg)

Diseñé la infraestructura en AWS utilizando las mejores prácticas de despliegue de aplicaciones web en la nube de AWS (Well-Architected Framework), empleando el uso de varias zonas de disponibilidad para obtener alta disponibilidad en nuestras cargas de trabajo. Dentro de los servicios utilizados están:

- EKS para el manejo de nuestro clúster de Kubernetes.
- VPC para el manejo de la red que intercomunica los servicios
- EC2 para los nodos workers de nuestro clúster de Kubernetes.
- Elastic Load Balancer para asignar un punto de entrada para nuestro Ingress.
- NAT Gateway para el acceso a Internet de nuestros nodos workers para descargar las imágenes de Docker desde DockerHub.
- CloudWatch para monitorear el consumo de los recursos.
- SNS para enviar notificaciones para alertar a los administradores de la infraestructura.
- S3 para almacenar el remote state de terraform.
- Dynamo DB para almacenar el lock del terraform state.


## Tecnologías Utilizadas

Para la ejecución de este proyecto utilicé:

- Terraform
- Python
- Docker
- Github
- AWS Codebuild
- Bash Script
- EKS como distribución de Kubernetes
- ALB Ingress Controller
- ArgoCD

Diseñé el pipeline en AWS CodeBuild, el CI donde se prueba el codigo y se crea la imagen de docker luego es subida al repositorio en docker hub luego se corre el script que actualiza el tag de la imagenes des los servicios. El CD es manejado por ArgoCD que se mantiene monitoreando el folder helm donde estan los manifiestos de kubernetes para aplicarlos al momento de reproducirse un cambio.

## Repositorios y Documentos

- [Frontend Docker Image](https://hub.docker.com/r/xkingrd/simetrik-frontend)
- [Backend Docker Image](https://hub.docker.com/r/xkingrd/simetrik-backend)
- [Terraform IAC Files](https://github.com/rancesking/Challenge-sm/tree/main/Terraform)
- [Helm Files K8s](https://github.com/rancesking/Challenge-sm/tree/main/helm)
- [CI/CD Codedbuild Spec's](https://github.com/rancesking/Challenge-sm/blob/main/buildspec.yml)


## Uso

1) Clonar el repositorio, exportar las variables de las credenciales de la cuenta de AWS e inicializar el despliegue de la infraestructura.

```js
git clone https://github.com/rancesking/Challenge-sm.git
cd Challenge-sm/Terraform
export AWS_ACCESS_KEY_ID=AKIASEXAMPLEKEY
export AWS_SECRET_ACCESS_KEY=JBXWX6uh3EXAMPLESECRETKEY
terraform init
terraform apply
```

2) Actualizar las credenciales de acceso al cluster de kubernetes y desplegar la aplicación usando helm.

```js
aws eks update-kubeconfig --region us-east-1 --name dev-cluster-xxxxxx
cd Challenge-sm/helm
helm install python-app .
```

3) Verificar el funcionamiento de la app

```js
kubectl get pods
kubectl get ingress
Consultar usando el explorador: http://python-grcp-ingress-594997929.us-east-1.elb.amazonaws.com/
```

## Licencia

Copyright © 2023 Rances Acosta. Todos los derechos reservados.