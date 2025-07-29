#!/bin/bash

# to run this script, save it as setup.sh and execute it with bash setup.sh
#chmod +x setup.sh
#source setup.sh

# Set project root
PROJECT_ROOT=.

# Create directory structure
mkdir -p $PROJECT_ROOT/data
mkdir -p $PROJECT_ROOT/src
mkdir -p $PROJECT_ROOT/tests

# Create README.md with starter content
cat > $PROJECT_ROOT/README.md <<EOL
# Template Repo

This is a starter template for Python projects.

## Structure

- \`src/\`: Source code
- \`tests/\`: Unit tests
- \`data/\`: Data files
EOL

# Create pytest.ini with starter content
cat > $PROJECT_ROOT/pytest.ini <<EOL
[pytest]
testpaths = tests
EOL

# Create requirements.txt (empty or with example packages)
cat > $PROJECT_ROOT/requirements.txt <<EOL
# Add your project dependencies here
EOL

# Create src/main.py with starter code
cat > $PROJECT_ROOT/src/main.py <<EOL
#!/usr/bin/env python3

def main():
    print("Hello from the template repo!")

if __name__ == "__main__":
    main()
EOL

# Create .gitignore with common Python ignores
cat > $PROJECT_ROOT/.gitignore <<EOL
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Virtual environment
venv/

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
*.egg-info/
.installed.cfg
*.egg

# Pytest cache
.pytest_cache/

# VS Code settings
.vscode/
EOL

# Set up virtual environment
cd $PROJECT_ROOT
python3 -m venv venv
source venv/bin/activate

# Upgrade pip and install requirements
pip install --upgrade pip
if [ -s requirements.txt ]; then
    pip install -r requirements.txt
fi

echo "Template repo created, virtual environment set up, requirements installed, and .gitignore added."
