# ARG HADOOP_VERSION

# FROM namenode:${HADOOP_VERSION}

# RUN wget https://dlcdn.apache.org/hive/hive-3.1.3/apache-hive-3.1.3-bin.tar.gz

# RUN set -x && \
#     tar -zxvf apache-hive-3.1.3-bin.tar.gz && \
#     mv apache-hive-3.1.3-bin /usr/local/etc/apache-hive-3.1.3-bin && \
#     rm apache-hive-3.1.3-bin.tar.gz


# ENV HIVE_HOME="/usr/local/etc/apache-hive-3.1.3-bin"
# ENV HIVE_CLASSPATH="${HIVE_HOME}/lib/*.jar"
# ENV HIVE_CONF=${HIVE_HOME}/conf
# ENV PATH=$PATH:$HIVE_HOME/bin

# RUN wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar -O ${HIVE_HOME}/lib/postgresql-9.4.1212.jar
# RUN wget https://jdbc.postgresql.org/download/postgresql-42.6.0.jar -O ${HIVE_HOME}/lib/postgresql-42.6.0.jar

# RUN rm ${HIVE_HOME}/lib/guava-*.jar
# RUN wget https://repo1.maven.org/maven2/com/google/guava/guava/27.0-jre/guava-27.0-jre.jar -O ${HIVE_HOME}/lib/guava-27.0-jre.jar

# RUN mkdir -p ${HIVE_HOME}/auxlib
# RUN wget https://github.com/delta-io/connectors/releases/download/v0.6.0/delta-hive-assembly_2.12-0.6.0.jar -O ${HIVE_HOME}/auxlib/delta-hive-assembly_2.12-0.6.0.jar

# COPY hive-conf/*.xml ${HIVE_HOME}/conf

# WORKDIR /usr/local/etc/

# CMD source ~/.bashrc

ARG HADOOP_VERSION

FROM hadoop:${HADOOP_VERSION}

RUN wget https://dlcdn.apache.org/hive/hive-3.1.3/apache-hive-3.1.3-bin.tar.gz

RUN set -x && \
    tar -zxvf apache-hive-3.1.3-bin.tar.gz && \
    mv apache-hive-3.1.3-bin /usr/local/etc/apache-hive-3.1.3-bin && \
    rm apache-hive-3.1.3-bin.tar.gz

ENV HIVE_HOME="/usr/local/etc/apache-hive-3.1.3-bin"
ENV PATH=$PATH:$HIVE_HOME/bin

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install postgresql-client-12 -y

# RUN wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jre7.jar -O ${HIVE_HOME}/lib/postgresql-9.4.1212.jre7.jar

RUN wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar -O ${HIVE_HOME}/lib/postgresql-9.4.1212.jar

RUN mkdir -p ${HIVE_HOME}/auxlib
RUN wget https://github.com/delta-io/connectors/releases/download/v0.6.0/delta-hive-assembly_2.12-0.6.0.jar -O ${HIVE_HOME}/auxlib/delta-hive-assembly_2.12-0.6.0.jar

COPY hive-conf/hive-site.xml ${HIVE_HOME}/conf

ENV HIVE_CLASSPATH="${HIVE_HOME}/lib/*.jar"
ENV HIVE_CONF=${HIVE_HOME}/conf
ENV HIVE_AUX_JARS_PATH=$HIVE_HOME/auxlib

CMD schematool -dbType postgres -initSchema --verbose