PACKAGE_MANAGER = npm
PACKAGE_MANAGER_INSTALL_SUBCOMMAND = install
REQUIRED_NODE_VER=v10
REQUIRED_NPM_VER=6.9.0
REQUIRED_LERNA_VER=3.13.1

NODE_VER=$(shell node -v)
NPM_VER=$(shell npm -v)
LERNA_VER=$(shell lerna -v)

# Install Everything
# ------------------------------------------------------------------------------
social: copy-github-hooks

# Copy GitHub Hooks
# ------------------------------------------------------------------------------
copy-github-hooks:
	cp .githooks/pre-commit.sh .git/hooks/pre-commit && chmod +x .git/hooks/pre-commit
