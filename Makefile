install:
	#pip installing
	pip install --upgrade pip &&\
		pip install -r requirements.txt
format:
	#code formatting
lint:
	#pylint
test:
	#pytest
deploy:
	#docker
all:
	#run all commands together
	install lint test deploy