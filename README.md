# Project 2 IaC with Terraform

## Setup instructions 

* Make sure to change the region in variable.tf to where you wish to run the project
* On AWS set up an s3 bucket and replace the name of the bucket in backend.tf with your bucket
* Create instances with the app and database running and create images from these instances
* Replace the ami's in variable.tf with your image id's
* Open this project in terminal
  * Make sure youre logged in to you're AWS account in the terminal
  * Make sure terraform is installed
* Run terraform apply
* Go to the public IP of the app vm once its finished initializing and ou should see the app running

## Architecture Diagram 

![architecture.png](/images/architecture.PNG)
* The internet gateway allows for external traffic into the vpc
* The route table directs that traffic to the public subnet
* The autoscaling group create new instances for the app if the traffic overwhelms the already running instances
* The internal route table allows for the database instance and the app instance to connect

## Contribution guidelines for future developers 

* Contributions are welcome
* Any changes should be clearly documented on their benefit and what they add to the project
* Any changes made should follow the conventions of the existing project
* An changes must be tested locally before being pushed to GitHub

## What you learnt/Benefits from the project

* Further reinforces my knowledge of terraform
* First time creating an autoscaling group and launch template in# tech603-steven-project2
