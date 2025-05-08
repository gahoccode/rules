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
   - When asked to modify code snippets, always return full code snippets and explain the changes made separately (additions, deletions, and modifications)
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

## MCP Servers and tool calling
   - Use context7 to get the latest documentation for dependencies in requirements.txt and apply it to the codebase
   - Use Sequential Thinking MCP for planning each step
   - Maintain continuity and forward momentum through Sequential Thinking
   - Use taskmaster-ai for task analysis and management

## Task Analysis
   - Initiate a project using taskmaster with the requirements
   - Analyze complexity with taskmaster and generate substasks.
   - Set status after finish with each task
   - Create a Changelog with checkboxes to keep track and update on progess
   - Remove tasks/ in .gitignore for testing and referencing

## Task Management
   - Every time changes are made, go back to the change log and update on what's changed. Keep track of task completions with checkboxes. 
   - Run integration tests when a new feature is added. 
   - Explain your conditional statements in your code with comments. 
## Code Organization

1. **Modular Design**
   - Separate concerns into different modules
   - Keep modules focused on single responsibility
   - Use consistent imports across projects

2. **Standard Library Structure**
   - Create reusable utility modules for common operations

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
   - Setup instructions should specify python version and installation methods such as pip install, uv
   - Document new changes made to the codebase


## Quality Standards

1. **Testing Requirements**
   - Create unit tests for all core functions that involve calculations and data processing
   - Validate output reasonableness (weights sum to 1, etc.)


## Environment Management

1. **Virtual Environment Requirements**
   - Use a virtual environment for each project
   - Install dependencies in virtual environment
   - Activate the virtual environment before running scripts
   - Spin up server and preview in virtual environment

## Code Review Standards
[tool.ruff.lint]
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

2. **Initial Project Setup**
   - uv init --python-version 3.10.11   # Install dependencies
   - Add ruff as linter to pyproject.toml and requirements.txt
   - uv pip install -r requirements.txt
   - Add Rich and Ruff to requirements.txt and pyproject.toml and pin down the absolute version
   - Add from rich import print to all python files
   - Add [tool.ruff.lint] to pyproject.toml
   - Dependencies: vnstock==3.2.2, gunicorn, tenacity==9.1.2
   - 
   - PYTHON_VERSION=3.10.11
   - uv venv -p 3.10.11
   - PORT=5000
   - HOST=0.0.0.0
   - Render start command:gunicorn app:app --timeout 120
   - Add pyproject.toml [project] requires-python = "==3.10.11"


3. **Dependency Management**
   - Use `requirements.txt` to manage project dependencies
   - Create batch script named Run.bat to automate the process of creating and activating virtual environment, installing dependencies, and running scripts. 
   - Batch script should include a selection menu for running scripts, selecting virtual environment, and installing dependencies, update requirements.txt and pyproject.toml when necessary.
   - Use uv for dependency management
   - Write requirements.txt with pinned versions
   - Update requirements.txt when adding new dependencies
   - When new package is added to requirements.txt, also update pyproject.toml for uv
   - Dependencies version should be consistent across requirements.txt and pyproject.toml
   - Check the required python version before installing dependencies

## CLI Language
   - Utilize the Rich library to enhance CLI output with features such as text formatting, progress bars, tables, error messages, logs, colored text, interactive prompts, and complex data structure displays.

## Best Practices for Tool Efficiency

1. **Template Utilization**
   - Define code templates for common operations
   - Reference templates by name when generating new code
   - Example: "Use the DATA_LOADING template for the new data source"

2. **Implementation Plans**
   - Request implementation plan before full code generation
   - Review and approve plan before requesting implementation
   - Format: Brief bullet points of approach, key functions, and interfaces

## GitHub Repository Management

1. **Repository Structure**
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


