# Use builds from launchpad
FROM opencpu/base

# Install development tools
RUN \
  apt-get install -y rstudio-server r-base-dev sudo curl git libcurl4-openssl-dev libssl-dev libxml2-dev libssh2-1-dev libcairo2-dev libxt-dev libgdal-dev gdal-bin libproj-dev proj-data proj-bin libgeos-dev bwidget xorg libx11-dev libglu1-mesa-dev 

# Workaround for rstudio apparmor bug
RUN echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf

CMD service cron start && /usr/lib/rstudio-server/bin/rserver && apachectl -DFOREGROUND
