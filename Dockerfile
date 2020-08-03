FROM ubuntu
RUN apt-get update
RUN apt-get install -y python
RUN echo 1.0 >> /etc/version && apt-get install -y git \ 
    && apt-get install -y iputils-ping

#WORKDIR
RUN mkdir /datos
WORKDIR /datos
RUN touch f1.txt
RUN mkdir /datos1
WORKDIR /datos1
RUN touch f2.txt

#COPY
COPY index.html .
COPY app.log /datos

#ADD
ADD docs docs
ADD f* /datos/
ADD f.tar .

#ENV
ENV dir=/data1
ENV LLAVE_SECRETA=perro123
RUN mkdir $dir

#ARG
#ARG dir2
#RUN mkdir $dir2
#ARG user
#ENV user_docker $user
#ADD addUser.sh /datos1
#RUN /datos1/addUser.sh


#EXPOSE
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y apache2
EXPOSE 80
ADD entrypoint.sh /datos1

#VOLUME
ADD paginas /var/www/html
VOLUME ["/var/www/html"]

#CMD
CMD /datos1/entrypoint.sh

#ENTRYPOINT
#ENTRYPOINT  ["/bin/bash"]