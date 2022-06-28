# Faceit Exercise


![APPLICATION SETUP](https://github.com/dlawton20-devops/faceit/blob/main/Faceit.png)

## Terraform Setup and Pipeline Execution:
When working in a team, deploying our infrastructure from a CI/CD tool or developing a Terraform using multiple layers, we need to store the state file in a remote backend and lock the file to avoid mistakes or damage the existing infrastructure.

To avoid this we use Google Cloud Storage to keep our files safe and share between multiple users.

### Prerequisites
We will have a few requirements to create your GCP backend using Terraform.

#### GCP Service Account
We will need a GCP Service Account with Storage Admin (roles/storage.admin) permissions and the JSON file of the Service Account.

#### Cloud Storage API enabled
Also, we will need the Google Cloud Storage API enabled in GCP via the console.

#### Update variables for pipeline execution
Normally for managing variables I would use either github secrets and token replacement for the variables or hashicorp vault, but for speed i've hardcoded the values (Bad practice) 
The variables need updating in the following place 'faceit/terraform/statebucket/terraform.tfvars' to reference your gcp project information and also change the Github actions variable 'GCP_CREDENTIALS' for your service account json value. 

This will deploy a Storage Bucket in GCP for the state file. To deploy use the pipeline in Github Actions called: 'Terraform State Bucket Creation'

#### Deploy GCP Services for Application
Once the state file is deployed, and all variables need updated in 'faceit/terraform/terraform.tfvars' for deployment of GCP infastructure then terraform will deploy several services in GCP for the application:

- GKE Google Kubernetes Engine - Cluster will be deployed for the application kubernetes will allow us to deploy and scale our application for more users.
- GCR Google Container Registry - This will store our docker images with the build application, which will be then deployed into GKE.
- Cloud SQL - Postgres DB will be deployed with settings that allow for connection to the application in Kubernetes Cluster via a Private VPC.
- VPC network - a private network for connectivity between the cluster application and DB.

To deploy use the pipeline in Github Actions called: 'Terraform CI/CD' which triggers off a PR/Changes into the main branch. This pipeline will deploy all infrastructure required for the application to work. 

#### Build and Deploy application into Kubernetes
In the Kubernetes folder in the repo, two files have been created one is the deployment.yaml which provides our declarative updates for Pods and ReplicaSets. This allows us to define the number of replicas we would like for the application, thus allowing us to scale up and down the application. 

The other file is is called 'scaling.yaml which implements HorizontalPodAutoscaler. This works with the deployment.yaml by automatically updating a workload resource, with the aim of automatically scaling the workload to match demand which in this case is based around the CPU usage.

To build and deploy our application use the pipeline in Github Actions called: 'Build and Deploy to GKE'. This pipeline builds the GoLang application binary using a Dockerfile, then tags the image and push it to the Google Container Registry ready for Kubernetes. Once this has completed it will connect to the kubernetes cluster and apply the deployment.yaml and scaling.yaml. 

This should deploy the application successfully with the env settings for connection baked into the deployment.yaml.

#### Improvements

- Github Secrets and Token Replacements- Rather than following the bad practice around hardcoded values using token replacement is a good way to manage variables in a secure manor for terraform varaibles and Kubernetes yaml values. 
- Kubernetes Secrets for DB connection - This is a good replacement for the DB env values. 
- Terraform Modules- creating terraform modules for a better overall stucture for terraform and using modules can save time and reduce costly errors by re-using configuration
- Code/Library scanning for security- static code scans for improving overall code security and 3rd party vulnerability scanning using tools like: sonarqube and meterian.   




