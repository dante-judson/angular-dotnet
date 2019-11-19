FROM mcr.microsoft.com/dotnet/core-nightly/sdk:3.0

WORKDIR /script
COPY startup.sh .

WORKDIR /vsdbg

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
            unzip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://aka.ms/getvsdbgsh \
        | bash /dev/stdin -v latest -l /vsdbg

WORKDIR /app

ENV DOTNET_USE_POLLING_FILE_WATCHER 1

ENV PATH $PATH:/script

RUN apt-get update

RUN apt-get install build-essential libssl-dev -y

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash

RUN apt-get install nodejs

RUN dotnet --version

RUN npm -v

RUN node -v

EXPOSE 5000
EXPOSE 49153

CMD /bin/bash -c startup.sh