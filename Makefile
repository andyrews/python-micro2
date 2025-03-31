install:
	#pip installing
	python3.11 -m venv venv && \
	. venv/bin/activate && \
	pip install --upgrade pip && \
	pip install -r requirements.txt && \
	python -m textblob.download_corpora

format:
	#code formatting using black
	. venv/bin/activate && \
	black *.py mylib/*.py
lint:
	#pylint
	. venv/bin/activate && \
	pylint --disable=R,C *.py mylib/*.py
test:
	#pytest
	. venv/bin/activate && \
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build:
	#build container
	. venv/bin/activate && \
	docker build -t deploy-wiki .
run:
	#running docker
	. venv/bin/activate && \
	docker run -d -p 8000:8000 deploy-wiki

deploy:
	#AWS ECR
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 985539758891.dkr.ecr.us-east-1.amazonaws.com
	docker build -t python-wiki .
	docker tag python-wiki:latest 985539758891.dkr.ecr.us-east-1.amazonaws.com/python-wiki:latest
	docker push 985539758891.dkr.ecr.us-east-1.amazonaws.com/python-wiki:latest
all:
	#run all commands together
	install lint test 
