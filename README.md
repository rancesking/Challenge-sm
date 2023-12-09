# DevOps Test

Esta es mi implementación de la aplicación demo para la prueba de DevOps!.

## Diseño de infraestructura en AWS

![Diagrama de Infraestructura](https://i.ibb.co/PFhw5Bf/Simetrik-Dev-Ops-Test-Racosta.jpg)

Diseñé la infraestructura en AWS utilizando las mejores prácticas de despliegue de aplicaciones web en la nube de AWS (Well-Architected Framework), empleando el uso de varias zonas de disponibilidad para obtener alta disponibilidad en nuestras cargas de trabajo. Dentro de los servicios utilizados están:

- EKS para el manejo de nuestro clúster de Kubernetes.
- EC2 para los nodos workers de nuestro clúster de Kubernetes.
- Elastic Load Balancer para asignar un punto de entrada para nuestro Ingress.
- NAT Gateway para el acceso a Internet de nuestros nodos workers para descargar las imágenes de Docker desde Docker Hub.
- CloudWatch para monitorear el consumo de los recursos.
- SNS para enviar notificaciones para alertar a los administradores de la infraestructura.


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

Diseñé 1 pipeline en AWS CodeBuild, el CI donde se prueba el codigo y se crea la imagen de docker luego es subida al repositorio en docker hub. Otro para el CD donde se modifican los datos en el manifiesto helm para ser escaneado por argo para hacer el CD.

## Repositorios y Documentos

- [Frontend Docker Image](https://hub.docker.com/r/xkingrd/simetrik-frontend)
- [Backend Docker Image](https://hub.docker.com/r/xkingrd/simetrik-backend)
- [Terraform IAC Repo](https://github.com/rancesking/Challenge-sm/tree/main/Terraform)
- [Manifiestos helm de K8s](https://github.com/rancesking/Challenge-sm/tree/main/helm)
- [CI/CD Codedbuild yml](https://github.com/rancesking/Challenge-sm/blob/main/buildspec.yml)


## Uso

WIP

## Licencia

Copyright © 2023 Rances Acosta. Todos los derechos reservados.