build: all

cur-dir   := $(shell basename `pwd`)

all: codetest

test: codetest apptest

codetest:
	@echo "~> Checking codestyle"
	flake8 --count django_reference_app

apptest:
	@echo "~> Running app tests"
	cd django_reference_app && SECRET_KEY=randomSecretKeyForTesting python manage.py test

prepare:
	# Following commands prepare developer environment adding appropriate githooks
	@echo "~> Preparing environment"
	# Please note that "@" supress output of commands.
	@pip install --upgrade -r requirements.txt
	# There are two ways to add githooks
	# 1.
	# @git config core.hooksPath .githooks
	# 2.
	# symlink based:
	@find .git/hooks -type l -exec rm {} \;
	@find .githooks -type f -exec ln -sf ../../{} .git/hooks/ \;
