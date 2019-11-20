## IaC Kafka deployment on AWS/EC2 for development tests. 
This is a cool and a cheap way to use a minimum Kafka setup on an AWS spot intance. You can deploy and share this with your team. 

**DO NOT** use this repository for production deployments. For production better use a confluent kafka service or something similar.
### What is this repository for?

* This respository contains Terraform code & scripts to deploy a minimal Kafka on AWS for development testing.
* The code is not using any managed Kafka service, load balancers or persistent storage.

### How do I get set up?

* Configuration: Assuming you have already a deployed VPC network with all necessary security groups, firewall rules, the right assigned IAM roles and VPN access in place, you have just to edit the **terraform.tfvars** to set the right subnet ids.
* Deployment instructions: ```terraform init && terraform plan && terraform apply```
[![asciicast](https://asciinema.org/a/FT26sm1HasdVGJAnwRVdvdVat.png)](https://asciinema.org/a/FT26sm1HasdVGJAnwRVdvdVat)
* Use: Now you can create a SSH tunnel with ```ssh -i ~/.ssh/aws-key -L 9092:127.00.1:9092 -L 2181:127.0.0.1:2181 ubuntu@<YOUR-NEW-EC2-ip>``` to remap the remote ports locally and then use your Kafka at 127.0.0.1:9092.
* Destroy / clean all: 
  ```terraform destroy```
[![asciicast](https://asciinema.org/a/qfI7tGlamMVewwriyU2Xq4PAj.png)](https://asciinema.org/a/qfI7tGlamMVewwriyU2Xq4PAj)

### Contribution guidelines

* As all the Terraform based projects, terraform stores in **terraform.tfstate** file the latest state of the infrastructure. Be sure you're keeping this file in a private safe place.

### Who do I talk to?

* My name is Nick. You can contact me at: 
