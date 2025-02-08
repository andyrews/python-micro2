install:
	#pip installing
	pip install --upgrade pip &&\
		pip install -r requirements.txt &&\
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
	docker run -p 127.0.0.1:8080:8080 deploy-wiki
deploy:
	#docker
all:
	#run all commands together
	install lint test deploy