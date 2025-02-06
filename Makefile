install:
	#pip installing
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	#code formatting using black
	black *.py mylib/*.py
lint:
	#pylint
	pylint --disable=R,C *.py mylib/*.py
test:
	#pytest
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build:
	#build container
deploy:
	#docker
all:
	#run all commands together
	install lint test deploy