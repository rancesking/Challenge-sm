# EKS Cluster module

## Description

This is a Terraform module for creating AWS EKS Clusters. This eks cluster have the ALB ingress Controller deployed.

## Usage

Here's an example usage:

```hcl
module "eks_cluster" {
  source = ./modules/eks
  
  aws_region        = "us-east-1"
  env               = "dev"
  cli_user          = "tester"
  cluster_size      = "small"

}
```

## Inputs

| Variable Name | Description | Type | Default | Required |
| --- | --- | --- | --- | --- |
|<a name="aws_region"></a> `aws_region` | The Region where the resources will be deployed | `string` |  | **Yes** |
|<a name="env"></a> `env` | The enviroment of the deployment. dev, stg & prod | `string` |  | **Yes** |
|<a name="cli_user"></a> `cli_user` |  The CLI user to associate with the eks cluster| `string` |  | **Yes** |
|<a name="cluster_size"></a> `cluster_size` |  The instance size of the worker node. Small:t4g.small Medium:t4g.medium Large:t4g.large  Default: small| `string` |  | No |

## Output Variables

| Output Name | Description | Example |
| --- | --- | --- |
| `aws_eks_cluster_name_output` | The name of the EKS cluster | `my-eks-cluster` |
| `username_output` | The name of the IAM user created for EKS access | `my-eks-user` |
| `access_key_id` | The access key ID for the created IAM user | `AKIAIOSFODNN7EXAMPLE` |
| `secret_access_key` | The secret access key for the created IAM user | `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY` |

