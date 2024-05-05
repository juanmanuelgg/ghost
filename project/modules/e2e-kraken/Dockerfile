# Construido sobre: https://about.gitlab.com/blog/2018/10/24/setting-up-gitlab-ci-for-android-projects/
FROM node:20

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y wget tar unzip openjdk-17-jdk \
    apt-transport-https fonts-liberation libgbm1 libgtk-4-1 libu2f-udev libvulkan1 libxkbcommon0  xdg-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

RUN curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && chmod +x google-chrome-stable_current_amd64.deb \
    && apt-get update \
    && apt-get --fix-broken -y install ./google-chrome-stable_current_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

USER node
WORKDIR /home/node

RUN mkdir -p /home/node/.npm-global/bin
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

COPY --chown=node:node tools /home/node/tools
WORKDIR /home/node/tools
RUN mv cmdline-tools/cmdline-tools cmdline-tools/latest

ENV PATH=/home/node/tools/cmdline-tools/latest/bin:$PATH
RUN chmod -R 755 /home/node/tools/cmdline-tools/latest/bin
RUN echo y | sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.0"

ENV ANDROID_HOME=/home/node/tools
ENV PATH=/home/node/tools/build-tools/33.0.0:$PATH
ENV PATH=/home/node/tools/platform-tools:$PATH

RUN sdkmanager --licenses

RUN mkdir -p /home/node/tests

WORKDIR /home/node/tests
COPY --chown=node:node package.json package-lock.json mobile.json ./
COPY --chown=node:node features features
COPY --chown=node:node helpers helpers

RUN npm ci --omit=dev || npm install --omit=dev

RUN mkdir -p reports

# Corrección de error en Kraken ====
# TODO: Compartir en Issue tracker y quitar despues de la corrección por parte de Kraken.
COPY --chown=node:node custom custom
# Se agrego una linea en el archivo FileHelper.js de Kraken
# this.createFolderIfDoesNotExist(path_1.default.dirname(path));
RUN cp custom/FileHelper.js /home/node/tests/node_modules/kraken-node/lib/utils/FileHelper.js
# ==================================

# Chorme headless
# https://github.com/GoogleChrome/chrome-launcher/commit/4771eafff2b5a93c8cad3c359d027253618b936b
ENV HEADLESS=true

LABEL org.opencontainers.image.source https://github.com/juanmanuelgg/ghost

ENTRYPOINT ["npm", "test"]
