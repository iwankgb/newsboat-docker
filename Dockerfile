FROM fedora:28 AS build_env

RUN dnf update -y && dnf install -y @development-tools libcurl-devel gnutls-devel ncurses-devel libgcrypt-devel pkgconf-pkg-config libxml2-devel krb5-devel json-c-devel stfl-devel libsq3-devel gettext asciidoc gcc-c++
RUN adduser -m newsboat

USER newsboat
WORKDIR /home/newsboat
RUN curl -L -O https://github.com/newsboat/newsboat/archive/r2.11.1.tar.gz
RUN tar xf r2.11.1.tar.gz
WORKDIR newsboat-r2.11.1
RUN make prefix=/opt/newsboat 
USER root
RUN make install prefix=/opt/newsboat 



FROM fedora:28

RUN dnf update -y && dnf install -y libcurl gnutls ncurses libgcrypt libxml2 json-c stfl libsq3 gettext
COPY --from=build_env /opt/newsboat /opt/newsboat
RUN curl -o /bin/gosu https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64
RUN chmod +x /bin/gosu
COPY user.sh /user.sh
ENTRYPOINT user.sh
CMD /opt/newsboat/bin/newsboat
