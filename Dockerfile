FROM ubuntu:bionic

WORKDIR /app/

RUN apt-get update && apt-get install -y wget gnupg unzip xvfb net-tools socat curl

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
    apt-get update && \
    apt-get install -y google-chrome-stable
RUN mkdir /userdata/ && mkdir /downloads/

ENV DBUS_SESSION_BUS_ADDRESS=/run/dbus/system_bus_socket
ENV DISPLAY=:99.0

COPY entrypoint.sh .
COPY startup.sh .
COPY fix_profile.py .

ENTRYPOINT ["/app/entrypoint.sh"]
