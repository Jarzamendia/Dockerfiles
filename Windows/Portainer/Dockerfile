FROM jarzamendia/nanoserver_base:1803

USER ContainerAdministrator

COPY ./portainer /

VOLUME C:\\certs
VOLUME C:\\data

EXPOSE 9000
ENTRYPOINT ["c:\\portainer.exe"]