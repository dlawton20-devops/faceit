# faceit


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

#### Update Github Actions Secrets for pipeline execution



