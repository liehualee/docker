ARG INSTALL_VERSION
FROM nginx:$INSTALL_VERSION
MAINTAINER llh

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;", "-c"]
CMD ["/etc/nginx/nginx.conf"]
