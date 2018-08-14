# escape=`

FROM microsoft/windowsservercore:1803 AS installer-env

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ADD https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.2.1.windows-amd64.zip  c:\\grafana.zip

RUN Expand-Archive c:\\grafana.zip -DestinationPath c:\\grafana_

RUN move-item c:\\grafana_\\grafana-5.2.1 grafana

FROM jarzamendia/nanoserver_base:1803

COPY --from=installer-env ["c:\\grafana", "c:\\grafana"]

COPY "custom.ini" "c:\\grafana\\conf\\custom.ini"

EXPOSE 8080

VOLUME ["c:\\grafana\\data\\"]

WORKDIR "c:\\grafana\\bin\\"

ENTRYPOINT ["c:\\grafana\\bin\\grafana-server.exe"]