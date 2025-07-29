---
trigger: manual
---

PYTHON-SPECIFIC RULES
--------------------

1. PEP8 COMPLIANCE
   - Follow PEP8 style guidelines for Python code
   - Use consistent indentation (4 spaces)
   - Use meaningful variable names
   - Use consistent naming conventions

2. NAMING CONVENTIONS
   - Variables and Functions
     - Follow the standard financial dictionary for consistent naming:
       ```python
       # Standard Financial Variables
       returns = ...          # Asset returns
       prices = ...           # Asset prices
       weights = ...          # Portfolio weights
       cov_matrix = ...       # Covariance matrix
       exp_returns = ...      # Expected returns
       risk_free_rate = ...   # Risk-free rate
       sharpe_ratio = ...     # Sharpe ratio
       sortino_ratio = ...    # Sortino ratio
       max_drawdown = ...     # Maximum drawdown
       annual_volatility = ...# Annualized volatility
       ```
   - Classes
     - Use `PascalCase` for class names
     - Name classes after the financial concepts they represent
     - Example: `EfficientFrontier`, `RiskModel`, `PortfolioOptimizer`
   - Constants
     - Use `UPPER_CASE_WITH_UNDERSCORES` for constants
     - Example: `TRADING_DAYS_PER_YEAR = 252`, `RISK_FREE_RATE = 0.02`
   - Alias
     - PyPortfolioOpt aliases:
       - expected_returns = mu (Expected returns vector)
       - cov_matrix = S (Covariance matrix)
     - Riskfolio-lib aliases:
       - {portfolio}_weights = w (Portfolio weights)
       - Example: `max_sharpe_portfolio_weights = w_max_sharpe`
       - rf: Risk-free rate
       - l: Risk aversion factor (lambda)
       - b: Risk budgeting constraint vector  
       - port = rp.Portfolio() # Short Aliases for Instantiated Objects
       - rm: risk measure ("MV", "MAD", "MSV", "FL", "CVaR", "EVaR", "WR", "ADD", "CDaR", "EDaR", "MDD")
       - obj: objective function ("MinRisk", "MaxRet", "Utility", "Sharpe", "ERC", "RBURG")
       - model: specifies the portfolio optimization model ("Classic", "BL", "FM", "FFM", "RRP", "RBURG", "WC", "OWA", "HRP", "HERC", "NCO")
     - Abbreviations:
       - Classic: Traditional Markowitz mean-risk portfolio optimization
       - BL: Black-Litterman model combining market equilibrium with investor views
       - FM: Factor Model for factor-based portfolio optimization
       - FFM: Factor Model (alternative abbreviation)
       - RP: Risk Parity (Equal Risk Contribution) portfolio
       - RRP: Relaxed Risk Parity portfolio with flexible constraints
       - RBURG: Risk Budgeting portfolio with custom risk allocation
       - WC: Worst-Case optimization for uncertainty in parameters
       - OWA: Ordered Weighted Averaging for advanced portfolio optimization
       - HRP: Hierarchical Risk Parity using clustering for diversification
       - HERC: Hierarchical Equal Risk Contribution combining clustering with risk parity
       - NCO: Nested Clustered Optimization performing optimization within clusters

3. FUNCTION DOCUMENTATION
   - Use Google-style docstrings
   - Include parameter types, return types, and examples
   - Document financial interpretation of parameters and results

4. CODE REVIEW STANDARDS
   - [tool.ruff.lint]
     select = [
       "F401",  # Unused imports
       "F841",  # Local variable assigned but never used
       "F821",  # Unused local variable
       "F811",  # Duplicate argument
       "F822",  # Unnecessary lambda
       "F823",  # Local variable referenced before assignment
       "F841",  # Local variable assigned but never used
       "W291",  # Trailing whitespace
       "W292",  # Trailing blank line
       "W293",  # Blank line contains whitespace
       "W391",  # Blank line at end of file
     ]

5. INITIAL PROJECT SETUP
   - uv init --python-version 3.10.11   # Install dependencies
   - Add ruff as linter to pyproject.toml and requirements.txt
   - uv pip install -r requirements.txt
   - Add Rich and Ruff to requirements.txt and pyproject.toml and pin down the absolute version
   - Add from rich import print to all python files
   - Add [tool.ruff.lint] to pyproject.toml
   - Dependencies: vnstock==3.2.2, gunicorn, tenacity==9.1.2
   - PYTHON_VERSION=3.10.11
   - uv venv -p 3.10.11
   - PORT=5000
   - HOST=0.0.0.0
   - Render start command:gunicorn app:app --timeout 120
   - Add pyproject.toml [project] requires-python = "==3.10.11"

6. DEPENDENCY MANAGEMENT
   - Use `requirements.txt` to manage project dependencies
   - Create batch script named Run.bat to automate the process of creating and activating virtual environment, installing dependencies, and running scripts
   - Batch script should include a selection menu for running scripts, selecting virtual environment, and installing dependencies, update requirements.txt and pyproject.toml when necessary
   - Use uv for dependency management
   - Write requirements.txt with pinned versions
   - Update requirements.txt when adding new dependencies
   - When new package is added to requirements.txt, also update pyproject.toml for uv
   - Dependencies version should be consistent across requirements.txt and pyproject.toml
   - Check the required python version before installing dependencies

7. CLI LANGUAGE
   - Utilize the Rich library to enhance CLI output with features such as text formatting, progress bars, tables, error messages, logs, colored text, interactive prompts, and complex data structure displays

8. DEPLOYMENT
-------------

> **Port Reference:**
> - **Flask default port:** 5000
> - **Streamlit default port:** 8501

### 8.1 Deploying on Render
- Ensure your project has a `requirements.txt` and (if needed) a `pyproject.toml` specifying Python version.
- Set the following environment variables on Render:
  - `PYTHON_VERSION` (e.g., 3.10.11)
  - `PORT` (e.g., 5000 for Flask, 8501 for Streamlit)
  - `HOST` (e.g., 0.0.0.0)
- Use the following Render start command for Flask:
  ```sh
  gunicorn app:app --timeout 120
  ```
- For Streamlit, set the start command to:
  ```sh
  streamlit run app.py --server.port 8501 --server.address 0.0.0.0
  ```
- Pin all dependency versions in `requirements.txt`.
- If using private dependencies or GitHub links in `requirements.txt`, ensure proper authentication or SSH keys are configured in Render.

### 8.2 Deploying with Docker
- Use the following Dockerfile as a template. It installs `git` to support `requirements.txt` entries from GitHub:

  ```Dockerfile
  FROM python:3.10-slim

  # Install git (required for requirements.txt with GitHub links)
  RUN apt-get update && apt-get install -y git \
      && rm -rf /var/lib/apt/lists/*

  # Set work directory
  WORKDIR /app

  # Copy requirements and install dependencies
  COPY requirements.txt ./
  RUN pip install --upgrade pip && pip install -r requirements.txt

  # Copy the rest of the code
  COPY . .

  # Expose the port (use 5000 for Flask, 8501 for Streamlit)
  EXPOSE 5000 8501

  # Start command for Flask (adjust as needed)
  # CMD ["gunicorn", "app:app", "--timeout", "120", "--bind", "0.0.0.0:5000"]
  # Start command for Streamlit (uncomment if using Streamlit)
  # CMD ["streamlit", "run", "app.py", "--server.port", "8501", "--server.address", "0.0.0.0"]
  ```

- **Note:** If you use GitHub links in `requirements.txt`, `git` must be installed in the Docker image, as shown above.
- Build and run your Docker image (choose the correct port for your framework):
  ```sh
  # For Flask
  docker build -t my-python-app .
  docker run -p 5000:5000 my-python-app

  # For Streamlit
  docker build -t my-streamlit-app .
  docker run -p 8501:8501 my-streamlit-app
  ```

#### Render Deployment with Docker: Setting the Start Command

- **How Render Determines the Start Command:**
  - By default, Render will use the `CMD` specified in your Dockerfile to start your app.
  - You can override this by specifying a **Start Command** in the Render dashboard under your service's settings. If set, Render will use this command instead of the Dockerfile's CMD.

- **Best Practice:**
  - For most cases, set the correct `CMD` in your Dockerfile for the framework you use (Flask or Streamlit).
  - If you need to change the command without rebuilding the image, set the Start Command in Render's dashboard.

- **Examples:**
  - For Flask (in Dockerfile or Render Start Command):
    ```sh
    gunicorn app:app --timeout 120 --bind 0.0.0.0:5000
    ```
  - For Streamlit (in Dockerfile or Render Start Command):
    ```sh
    streamlit run app.py --server.port 8501 --server.address 0.0.0.0
    ```

- **Tip:**
  - Ensure the port you EXPOSE in your Dockerfile matches the port you bind in your start command and the PORT environment variable set in Render.

### 8.3 Deployment Requirements

#### Required Files

1. **Dockerfile** - Must include:
   - Appropriate Python version (e.g., `FROM python:3.10-slim`).
   - System dependencies including `git` for GitHub requirements.
   - Correct port exposure (5000 for Flask, 8501 for Streamlit).
   - Proper start command for your framework.

2. **start.sh** - Required for Render deployments:
   ```bash
   #!/bin/bash
   set -e
   PORT=${PORT:-8501}  # Use Render's PORT or default
   streamlit run app.py --server.port=$PORT --server.address=0.0.0.0
   ```

3. **render.yaml** - For infrastructure as code:
   ```yaml
   services:
     - type: web
       buildCommand: pip install -r requirements.txt
       startCommand: bash start.sh
       envVars:
         - key: PYTHON_VERSION
           value: 3.10.11
         - key: PORT
           value: 8501
   ```

#### Deployment Rules

1. **Port Handling**
   - Always use a `start.sh` script to handle Render's dynamic port assignment.
   - Include error handling with `set -e` in bash scripts.

2. **Configuration**
   - Use `render.yaml` for consistent, repeatable deployments.
   - Explicitly set Python version in all configuration files.
   - Pin all dependency versions in `requirements.txt`.

3. **System Dependencies**
   - Include all necessary system packages in Dockerfile.
   - For Streamlit: `build-essential`, `git`, `libxml2-dev`, `libxslt1-dev`.
   - For Flask with SQLAlchemy: include database drivers (e.g., `postgresql-dev`).

4. **Security**
   - Never hardcode secrets in Dockerfile or source code.
   - Use Render environment variables for sensitive information.
   - Clean up package caches with `rm -rf /var/lib/apt/lists/*`.

5. **Testing**
   - Test Docker deployment locally before pushing to Render.
   - Verify port binding and environment variable handling.

6.  **NO Conditional Imports**: 
  - Never use try/except blocks for imports of required packages
  - If a package is in pyproject.toml, import it directly at the top of the file
  - Handle specific errors during usage, not during import
  - Only use conditional imports for truly optional features (rare)
  
  