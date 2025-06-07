# Spring Boot App Deployment using Terraform on AWS

This project automatically creates an EC2 instance using Terraform and deploys a Spring Boot application on it.

##  What This Project Does

- Uses Terraform to create an EC2 machine
- Installs Java 21 (Zulu) and Maven using user_data script
- Clones your Spring Boot app from GitHub (https://github.com/techeazy-consulting/techeazy-devops)
- Runs the app on port 80



##  Requirements

- AWS account 
- Terraform installed
- Public GitHub repo with Spring Boot project (Java 21)
- Open port 80 in EC2 security group


##  How to Use

1. **Update Terraform variables**
   - AMI ID
   - Instance type
   - GitHub repo URL

2. **Run Terraform**
   ```bash
   terraform init
   terraform apply

 3. **Access the App**
    Open browser
    Visit: http://<your-ec2-public-ip>

Java Version Note
The project hosted at https://github.com/techeazy-consulting/techeazy-devops specifies Java 21 in its pom.xml.
Although initially told to use Java 19, I used Java 21 to match the project's dependencies and ensure successful build and deployment.

![Image](https://github.com/user-attachments/assets/c905adfd-26cf-417e-91e3-2d650cdf5d5d)

