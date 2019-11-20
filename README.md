## IaC Kafka deployment on AWS/EC2 for development tests. 

**DO NOT** use this repository for production deployments. For production better use a confluent kafka service or something similar.
### What is this repository for?

* This respository contains Terraform code & scripts to deploy a minimal Kafka on AWS for development testing.
* The code is not using any managed Kafka service, load balancers or persistent storage.

### How do I get set up?

* Configuration: Assuming you have already a deployed VPC network with all necessary security groups, firewall rules, the right assigned IAM roles and VPN access in place, you have just to edit the **terraform.tfvars** to set the right subnet ids.
* Deployment instructions: terraform init, terraform plan, terraform apply.
[![asciicast](https://asciinema.org/a/FT26sm1HasdVGJAnwRVdvdVat.png)](https://asciinema.org/a/FT26sm1HasdVGJAnwRVdvdVat)
* Destroy / clean all: 
[![asciicast](https://asciinema.org/a/LACfdFaD9Q8EfLBWnC9MH4KSa.png)](https://asciinema.org/a/LACfdFaD9Q8EfLBWnC9MH4KSa)

### Contribution guidelines

* As all the Terraform based projects, terraform stores in **terraform.tfstate** file the latest state of the infrastructure. Be sure you're keeping this file in a private safe place.

### Who do I talk to?

* My name is Nick. You can contact me at: 
