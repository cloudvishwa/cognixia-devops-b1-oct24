---

# Day 2: Code Development and Dockerization

## Developing Code in Visual Studio Code
- Developer works on the **Dev branch** using Visual Studio Code.
- Implements features or fixes, committing changes locally.

## Application Selection
- Choose a sample application:
  - **Python Flask app with Redis**.
- Clone the repository or create a new one in **Azure Repos**.

## Branch Management Setup
1. **Create a code repository** in Azure Repos:
   - **Dev Branch**: For ongoing development.
   - **Feature Branches**: For individual features or bug fixes.
   - **Master Branch**: For stable code, containing the latest release.

## Push Code to Azure Repos
- Push changes to the **Dev branch** in Azure Repos.
- Create **Pull Requests (PRs)** for code review when ready to merge changes into Master.

## Code Review Process
1. **Code owner reviews the PR**.
2. After approval, merge changes from **Dev** to **Master**.

## Dockerize the Application
1. **Create a Dockerfile** for the application.
2. Build the Docker image locally (if needed for testing):
   ```bash
   docker build -t my-app:latest .
   ```

## Push to Azure Container Registry
1. **Log in to ACR** using Azure CLI:
   ```bash
   az acr login --name <ACR_NAME>
   ```
2. **Tag the Docker image** for ACR:
   ```bash
   docker tag my-app:latest <ACR_NAME>.azurecr.io/my-app:latest
   ```
3. **Push the image** to ACR:
   ```bash
   docker push <ACR_NAME>.azurecr.io/my-app:latest
   ```


