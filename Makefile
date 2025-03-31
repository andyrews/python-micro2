install:
	#pip installing
	install:
	python3 -m venv venv && \
	source venv/bin/activate && \
	pip install --upgrade pip && \
	pip install -r requirements.txt && \
	python -m textblob.download_corpora

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
	docker build -t deploy-wiki .
run:
	#running docker
	docker run -p 127.0.0.1:8000:8000 deploy-wiki
deploy:
	#AWS ECR
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 985539758891.dkr.ecr.us-east-1.amazonaws.com
	docker build -t python-wiki .
	docker tag python-wiki:latest 985539758891.dkr.ecr.us-east-1.amazonaws.com/python-wiki:latest
	docker push 985539758891.dkr.ecr.us-east-1.amazonaws.com/python-wiki:latest
all:
	#run all commands together
	install lint test 
