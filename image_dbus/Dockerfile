ARG BASE_IMAGE=alpine:latest
FROM ${BASE_IMAGE}

SHELL ["/bin/ash", "-o", "pipefail", "-c"]

# [Option] Install zsh
ARG INSTALL_ZSH="false"

# Install needed packages and setup non-root user. Use a separate RUN statement to add your own dependencies.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ADD entry-point.sh /entry-point.sh
ADD tunnel-session.sh /tunnel-session.sh
RUN apk update \
    && apk add --no-cache dbus gnome-keyring libsecret \
    && mkdir -p /tmp/library-scripts \
    && cd /tmp/library-scripts \
    && wget "https://raw.githubusercontent.com/microsoft/vscode-dev-containers/main/script-library/common-alpine.sh" \
    && ash common-alpine.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" \
    && rm -rf /tmp/library-scripts \
    && rm -rf /var/cache/apk/* \
    && rm /etc/machine-id \
    && chmod a+x /entry-point.sh

# Install code cli into user env.
USER "${USERNAME}"
RUN mkdir -p "/home/${USERNAME}/.vscode-cli" \
  && mkdir -p "/home/${USERNAME}/.vscode-server" \
  && mkdir -p "/home/${USERNAME}/.local/share/keyrings" \
  && mkdir -p "/home/${USERNAME}/Documents" \
  && mkdir -p /tmp/code \
  && cd /tmp/code \
  && wget -q -O- 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' | tar -zxf - \
  && mkdir -p "/home/${USERNAME}/.local/bin" \
  && cp code "//home/${USERNAME}/.local/bin/code" \
  && rm -rf /tmp/code 


ENTRYPOINT ["/entry-point.sh"]