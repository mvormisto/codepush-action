FROM node:16-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/TripleSpeeder/codepush-action"
LABEL homepage="https://github.com/TripleSpeeder/codepush-action"
LABEL maintainer="Michael bauer <triplespeeder@gmail.com>"

LABEL com.github.actions.name="GitHub Action for Codepush"
LABEL com.github.actions.description="Wraps the appcenter CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

RUN npm install -g appcenter-cli

ARG directory
ENV INPUT_DIRECTORY=directory

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
