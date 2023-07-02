# 'install' target is used to set up the environment. This will first upgrade pip (Python's package installer) and then install the dependencies listed in the requirements.txt file.
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

# 'test' target will run the unit tests using the pytest module on all Python files within the 'tests' directory. The '-vv' flag is for verbose output, and '--cov' is for measuring code coverage.
test:
	python -m pytest -vv --cov=hello tests/*.py

# 'lint' target will run the linter (pylint) on all Python files in the current directory, while disabling warning categories R (Refactor) and C (Convention).
lint:
	pylint --disable=R,C *.py

# 'format' target will format all Python files in the current directory to meet the PEP 8 style guide using the Black code formatter.
format:
	black *.py

# 'container-lint' target will lint the Dockerfile using hadolint, a linter for Dockerfiles.
container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

# 'deploy' target will be used for deployment. The actual commands aren't provided here.
deploy:
	# deploy goes here

# 'all' target runs the install, lint, test, and format targets. This is a sort of "meta" target that allows you to run multiple targets with one command.
all: install lint test format


# pip install --upgrade pip: This command upgrades pip itself to the latest version, ensuring you have all the recent features and bug fixes.

# -r requirements.txt: The -r flag in pip install command is used to specify a requirements file. A requirements file lists all Python packages 
# that your project depends on. You can specify versions, too. It's a good practice to include this file in your project to make it easy for other 
# developers (or for deployment scripts) to install all necessary packages.

# python -m pytest -vv --cov=hello tests/*.py: The -m flag in python command is used to run library modules as scripts. -vv is a verbose mode in 
# pytest that gives more detailed output. --cov=hello is used with pytest to calculate the test coverage of the hello module.

# pylint --disable=R,C *.py: In this command, --disable=R,C is used to disable Refactor and Convention messages from pylint. These types of messages
#  are related to code style. Pylint checks your code against a large number of possible issues. It also checks if the code adheres to PEP 8, Python’s style guide.

# black *.py: Black is a Python code formatter. It automatically formats your code to make it more readable and consistent according to PEP 8.

# docker run --rm -i hadolint/hadolint < Dockerfile: This command runs Hadolint, a Dockerfile linter, in a Docker container. --rm option tells Docker
# to remove the container after it exits, and -i keeps STDIN open even if not attached, which is necessary for sending the Dockerfile content via STDIN.