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