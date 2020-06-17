FROM python:3.8-alpine

ADD requirements.txt /home/requirements.txt

RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
    && pip install -r /home/requirements.txt \
    && apk del .build-deps gcc musl-dev

ADD vault.py /home/vault.py
CMD ["/home/vault.py"]
ENTRYPOINT ["python"]
