FROM ruby:3.0.2

ARG USER
ARG UID
ARG GROUP=${USER}
ARG GID=${UID:-1000}
RUN if [ -n "${USER}" ]; then \
        groupadd --gid ${GID} ${GROUP} && \
        useradd --create --shell /bin/bash --gid ${GROUP} --uid ${UID:-1000} ${USER} ;\
    fi

USER ${USER:-root}

WORKDIR /app
