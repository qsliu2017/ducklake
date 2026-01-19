FROM ubuntu:latest

RUN apt-get update -y -qq \
    && apt-get install -y -qq build-essential cmake ninja-build ccache python3 curl ca-certificates git zip unzip tar

# Install PostgreSQL
RUN install -d /usr/share/postgresql-common/pgdg \
    && curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc \
    && . /etc/os-release \
    && sh -c "echo 'deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"

RUN apt update -y -qq \
    && apt install -y postgresql-18

# Install vcpkg
RUN git clone https://github.com/Microsoft/vcpkg.git /usr/local/vcpkg \
    && /usr/local/vcpkg/bootstrap-vcpkg.sh \
    && ln -s /usr/local/vcpkg/vcpkg /usr/local/bin/vcpkg

# Set working directory
WORKDIR /workspace
