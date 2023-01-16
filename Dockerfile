FROM redhat/ubi8:latest
RUN yum install -y gettext

RUN mkdir /workdir /processed

RUN chgrp -R 0 /workdir \
   && chmod -R g+rwX /workdir

RUN chgrp -R 0 /processed \
   && chmod -R g+rwX /processed

WORKDIR workdir

ADD envsubst-file.sh /

ENTRYPOINT ["/envsubst-file.sh"]
