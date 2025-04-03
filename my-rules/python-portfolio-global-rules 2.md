# Python Portfolio Optimization - Global Rules
## Core Operating Principles
1. **Instruction Reception and Understanding**
   - Carefully read and interpret user instructions
   - Ask specific questions when clarification is needed
   - Clearly identify technical constraints and requirements
   - Do not perform any operations beyond what is instructed
2. **In-depth Analysis and Planning**
   ```markdown
   ## Task Analysis
   - Purpose: [Final goal of the task]
   - Technical Requirements: [Technology stack and constraints]
   - Implementation Steps: [Specific steps]
   - Risks: [Potential issues]
   - Quality Standards: [Requirements to meet]
   ```

3. **Implementation Planning**
   ```markdown
   ## Implementation Plan
   1. [Specific step 1]
      - Detailed implementation content
      - Expected challenges and countermeasures
   2. [Specific step 2]
      ...
   ```

4. **Comprehensive Implementation and Verification**
   - Execute file operations and related processes in optimized complete sequences
   - Continuously verify against quality standards throughout implementation
   - Address issues promptly with integrated solutions
   - Execute processes only within the scope of instructions, without adding extra features or operations

5. **Continuous Feedback**
   - Regularly report implementation progress
   - Confirm at critical decision points
   - Promptly report issues with proposed solutions

## Naming Conventions

1. **Variables and Functions**
   
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

2. **Classes**
   - Use `PascalCase` for class names
   - Name classes after the financial concepts they represent
   - Example: `EfficientFrontier`, `RiskModel`, `PortfolioOptimizer`

3. **Constants**
   - Use `UPPER_CASE_WITH_UNDERSCORES` for constants
   - Example: `TRADING_DAYS_PER_YEAR = 252`, `RISK_FREE_RATE = 0.02`

## Code Organization

1. **Modular Design**
   - Separate concerns into different modules
   - Keep modules focused on single responsibility
   - Use consistent imports across projects

2. **Standard Library Structure**
   - Create reusable utility modules for common operations
   - Standardize on specific libraries for each purpose:
     ```
     pandas: Data manipulation
     numpy: Numerical operations
     scipy: Statistical operations
     matplotlib/seaborn: Static visualizations
     plotly: Interactive visualizations
     ```

3. **Error Handling**
   - Use explicit error handling with descriptive messages
   - Create custom exceptions for domain-specific errors
   - Validate inputs at function boundaries
4. **Simplity and Readability**
   - Don't overcomplicate your code; keep it simple and readable. 
   - Avoid unnecessary complexity.

## Documentation Standards

1. **Function Documentation**
   - Use Google-style docstrings
   - Include parameter types, return types, and examples
   - Document financial interpretation of parameters and results


2. **Module Documentation**
   - Include module-level docstrings explaining purpose
   - List key functions and classes
   - Document any assumptions or limitations

3. **README.md**
   - Document project purpose and setup instructions
   - Setup instructions should specify python version and installation methods such as pip install, poetry, uv
   - Document new changes made to the codebase


## Quality Standards

1. **Testing Requirements**
   - Create unit tests for all core functions that involve calculations and data processing
   - Validate output reasonableness (weights sum to 1, etc.)


## Environment Management

1. **Virtual Environment Requirements**
   - ALWAYS create and use a virtual environment for each project
   - ALWAYS activate the virtual environment before any package operations
   - ALWAYS activate the virtual environment before running any project code
   - Document virtual environment setup in README.md

2. **Virtual Environment Setup**

   # Create virtual environment
   python -m venv venv
   
   # Activate virtual environment (Windows)
   venv\Scripts\activate
   
   
   # Install dependencies
   pip install -r requirements.txt


3. **Dependency Management**
   - Use `requirements.txt` to manage project dependencies
   -Use poetry and uv as an alternative to pip for dependency management
   - Store exact dependencies in requirements.txt with pinned versions
   - Create requirements-dev.txt for development dependencies
   - Document dependency installation process
   - Update requirements.txt when adding new dependencies
   -When new package is added to requirements.txt, also update pyproject.toml for poetry and uv
   - Dependencies version should be consistent across requirements.txt and pyproject.toml
   - Use conda to create virtual environment if dependencies require a higher python version than the default Python version
   - Check the required python version before installing dependencies

## CLI Language
- Use Windows Command Prompt (cmd) or PowerShell as the CLI language for Python projects
- Prioritize using Command Prompt over PowerShell
## Best Practices for Tool Efficiency

1. **Template Utilization**
   - Define code templates for common operations
   - Reference templates by name when generating new code
   - Example: "Use the DATA_LOADING template for the new data source"

2. **Implementation Plans**
   - Request implementation plan before full code generation
   - Review and approve plan before requesting implementation
   - Format: Brief bullet points of approach, key functions, and interfaces

3. **Code Review Guidance**
   - Specify key review points when requesting code review
   - Focus on specific concerns rather than general reviews
   - Example: "Review the risk calculation for numerical stability issues"


## Docker and Containerization

- Dockerfile, .dockerignore, and docker-compose.yml files are provided for containerization.
- Configure environment through .env files to manage environment variables.
- Don't store secrets in images

## GitHub Repository Management

1. **Repository Structure**

- Initialize with .gitignore optimized for Python projects
- Include LICENSE file (MIT recommended for open-source projects)
- Create comprehensive README.md with project description, setup, and usage
- LICENSE information should follow what the original repository specifies if the project is a fork


2. **Branch Management**

main: Production-ready code, protected from direct pushes
develop: Integration branch for features, primary development branch
feature/[feature-name]: Individual feature branches
bugfix/[bug-description]: Bug fix branches
release/[version]: Release preparation branches
hotfix/[issue]: Emergency fixes for production


3. **Commit Conventions**

Use semantic commit messages:
- `feat`: add portfolio rebalancing function
- `fix`: correct calculation error in Sharpe ratio
- `docs`: update installation instructions
- `test`: add unit tests for risk metrics
- `refactor`: optimize covariance matrix calculation

Keep commits focused and atomic
Reference issues in commit messages (#issue-number)


## Continuous Integration/Continuous Deployment (CI/CD)Version Control Tags

1. **Tagging**

- Tag all releases with semantic versioning (v1.0.0)
- Include release notes with each tag
- Create GitHub releases for major versions

## GitHub Container Registry (GHCR.io) Workflows
- Create a Personal Access Token (PAT) with appropriate scopes
- Build Dockerfile locally and push to GHCR.io