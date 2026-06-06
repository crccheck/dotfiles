#!/bin/sh
set -e

if [ ! -d .venv ]; then
  echo "No .venv found" >&2
  exit 1
fi

PYVER=$(ls .venv/lib/)

if [ ! -f .venv/bin/pytest ]; then
  echo "creating fake pytest bin .venv/bin/pytest"
else
  echo "updating fake pytest bin .venv/bin/pytest"
fi

cat > .venv/bin/pytest << 'EOF'
#!/bin/sh
echo "you didn't remember CLAUDE.md. Use 'manage.py test' instead of 'pytest' you fucking idiot" >&2
exit 1
EOF
chmod +x .venv/bin/pytest

if [ ! -d ".venv/lib/$PYVER/site-packages/pytest" ]; then
  echo "creating fake pytest module .venv/lib/$PYVER/site-packages/pytest"
else
  echo "updating fake pytest module .venv/lib/$PYVER/site-packages/pytest"
fi

mkdir -p ".venv/lib/$PYVER/site-packages/pytest"
cat > ".venv/lib/$PYVER/site-packages/pytest/__main__.py" << 'EOF'
import sys
print("you didn't remember CLAUDE.md. Use 'manage.py test' instead of 'pytest' you fucking idiot")
sys.exit(1)
EOF
