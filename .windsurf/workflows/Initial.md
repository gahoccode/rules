

## Python Project Setup Workflow

### 1. Initialize Project
```bash
uv init --python-version 3.10.11
```

### 2. Create Virtual Environment
```bash
uv venv -p 3.10.11
```

### 3. Configure pyproject.toml
Add the following sections to `pyproject.toml`:
```toml
[project]
requires-python = "==3.10.11"

[tool.ruff.lint]
# Add ruff linting configuration here
```

### 4. Set Up Dependencies
Add the following to `requirements.txt` with pinned versions:
- vnstock==3.2.5
- gunicorn
- ruff (specific version)
- rich (specific version)

Also add ruff and rich to the dependencies section in `pyproject.toml`.

### 5. Install Dependencies
```bash
uv pip install -r requirements.txt
```

### 6. Update Python Files
Add the following import to all Python files:
```python
from rich import print
```

### 7. Configure Render Deployment
Set the following environment variables in Render:
- `PYTHON_VERSION=3.10.11`
- `PORT=5000`
- `HOST=0.0.0.0`

Set the start command:
```bash
gunicorn app:app --timeout 120
```
