FROM continuumio/miniconda3:latest
LABEL maintainer="Eugene Morozov <emorozov@gmail.com>"

COPY anaconda-project.yml anaconda-project.yml
COPY .projectignore .projectignore

RUN conda install anaconda-project
RUN anaconda-project prepare --env-spec notebook
RUN anaconda-project run register-kernel
RUN anaconda-project run generate-config

COPY moneyaggvoc.ipynb moneyaggvoc.ipynb

ENTRYPOINT ["anaconda-project", "run", "notebook", "--anaconda-project-address", "0.0.0.0", "--no-browser", "--allow-root"]