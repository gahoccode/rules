---
description: Guidelines on deploying to Render and Docker 
---

# Docker & Render Deployment Workflow

## 1. Containerize the Application
- Create Dockerfile
- Define base image and dependencies (e.g., `FROM python:3.10.11-slim`)
- Configure application environment
- Specify entrypoint command
- Expose correct port (port 5000 for Flask apps, port 8501 for Streamlit apps)

## 2. Create Deployment Scripts
- Develop start.sh script for Render
- Configure PORT and host binding (0.0.0.0:5000 for Flask, 0.0.0.0:8501 for Streamlit)
- Add error handling
- Set execution permissions

## 3. Configure Deployment Platforms
- Create render.yaml for infrastructure as code
- Define service type and environment
- Specify build and start commands
- Set environment variables including PYTHON_VERSION=3.10.11
- Configure PORT environment variable accordingly

## 4. Add Alternative Deployment Options
- For Flask: `web: gunicorn app:app`
- For Streamlit: `web: streamlit run --server.port=$PORT --server.address=0.0.0.0 app.py`


## 5. Local Testing
- Build Docker image
- Test with docker-compose
- Verify port mapping (5000:5000 for Flask, 8501:8501 for Streamlit)
- Validate environment variables (including PYTHON_VERSION=3.10.11)
- Ensure application is accessible from host

## 6. Disk cleanup
- Remove files in local testing to save disk space and prevent ports conflicts with other existing docker container 

## 7. Configure Version Control
- Commit all configuration files
- Ensure scripts have executable permissions
- Set up appropriate .gitignore