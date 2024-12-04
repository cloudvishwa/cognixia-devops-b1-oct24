# Day 3: Setting Up Azure DevOps Pipeline

## Fine-Tuning the Azure DevOps Pipeline
- **Move the deployment from the pipeline to the release pipeline.**
- **Apply gates** with a 2-minute wait.
- Modify the deployment and service files to use **namespace as a variable** so it can be passed as "dev" or "prod."
- Use a **variable** for storing "apply" or "destroy" actions in the infrastructure pipeline.
- Make the **tag dynamic** in the `deployment.yaml` file for the `python-app` to pick it up from the Azure pipeline.

## Release DevOps Pipeline
- **Set up a CI/CD pipeline in Azure DevOps** for production deployment with the following conditions:
  - Create a separate **release pipeline** for production.
  - Save the **manifest files** in the artifacts.
  - Deploy the manifests in the **prod namespace**.
  - Ensure there are **two separate Load Balancer public IPs** for dev and prod to facilitate testing.

## Testing the Pipeline
- Run the pipeline after merging to the `master` branch to ensure:
  - A new Docker image is built.
  - The deployment is completed without errors.

