FROM python:3.6-slim-stretch 
EXPOSE 8888

COPY . /sentiment-analysis
RUN pip install --upgrade pip
RUN pip install pipenv
WORKDIR /sentiment-analysis

RUN pipenv install --skip-lock 
RUN pipenv run python -m ipykernel install --user --name=nlp-dev 

CMD pipenv run -- jupyter-lab --allow-root --port 8888 --ip 0.0.0.0

