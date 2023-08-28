# Deploy Web Service Using Packer and Terraform

## Introduction
This project utilizes Packer and Terraform to automate infrastructure deployment in Azure. The project is divided into two parts:
* Part 1: Deploy a Packer image to Azure
* Part 2: Deploy a Terraform template to Azure

## Getting Started
To get started, you will need to do the following:

1. Ensure you have an Azure account. If you don't have one, you can create a free account [here](https://azure.microsoft.com/en-us/free/).
2. Install the Azure CLI. You can find instructions [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).
3. Install Packer. You can find instructions [here](https://www.packer.io/intro/getting-started/install.html).
4. Install Terraform. You can find instructions [here](https://learn.hashicorp.com/terraform/getting-started/install.html).
5. Connect to Azure using the Azure CLI. You can find instructions [here](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli?view=azure-cli-latest).
6. Create Azure credentials. You can find instructions [here](https://codekage.hashnode.dev/how-to-use-packer-to-create-linux-virtual-machine-images-in-azure-clls8vdfj000209lj4y4x6xzo#heading-create-azure-credentials).

## Part 1: Deploy a Packer image to Azure
Note: The Packer template file `server.json` is located in the `packer` directory.
1. Update the `client_id`, `client_secret`, `tenant_id` and `subscription_id` in the *Packer* `server.json` template file with your credentials.
2. On your terminal run `packer build server.json` to build the image. Then we can access using the Azure CLI via `az image list` to view and `az image delete --name <image_name>` to delete the image. You can also use the Azure Portal to access the image. Note the `id` of the image, this will be used in the Terraform template.

## Part 2: Deploy a Terraform template to Azure
Note: The Terraform template file `main.tf` is located in the `terraform` directory.
1. Update the `image_id` variable default in the `vars.tf` file with `id` of the image deployed via Packer in step 2 above.
2. Run `terraform init` to initialize the Terraform template.
3. Run `terraform validate` to validate the Terraform template.
4. Run `terraform plan -out solution.plan` to view the resources that will be created and save the plan to `solution.plan`.
5. Run `terraform apply "solution.plan"` to deploy the resources to Azure.
6. Run `terraform show` to view the resources that were created.
7. Run `terraform destroy` to destroy the resources that were created.
8. Run `terraform show` to view the resources that were destroyed.

## Output
The output of the Terraform template is a load balancer with a public IP address and a virtual machine scale set with a 
custom image deployed via Packer. The load balancer is configured to route traffic to the virtual machine scale set. 
The virtual machine scale set is configured to deny traffic from the internet and allow access to other VMs in the subnet.