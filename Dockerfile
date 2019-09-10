FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt-get install -y --no-install-recommends \
        git libgmp3-dev libsndfile-dev
RUN git clone --depth=1 https://github.com/Ignisor/ludwig-gpu.git \
    && cd ludwig-gpu/ \
    && pip install -r requirements.txt \
    && python -m spacy download en \
    && python setup.py install

WORKDIR /data

ENTRYPOINT ["ludwig"]
