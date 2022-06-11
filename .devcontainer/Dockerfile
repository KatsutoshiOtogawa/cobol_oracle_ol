# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/debian/.devcontainer/base.Dockerfile

ARG VARIANT="8.6"
FROM katsutoshiotogawa/oracle:oracle-linux-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
RUN dnf update -y

# # install cobol development environment
RUN wget --content-disposition -c https://sourceforge.net/projects/gnucobol/files/gnucobol/3.1/gnucobol-3.1.2.tar.gz
RUN mkdir /usr/local/gnucobol && tar zxvf gnucobol-*.tar.gz -C /usr/local/gnucobol --strip-components 1
RUN rm gnucobol-*.tar.gz
# require build for gnucobol. gmp-devel is bignum binary deal lib for cpp.
# libdb is berkerey db hdevelop lib.
RUN dnf install -y gcc gmp-devel libdb-devel
# make and install gnucobol.
# if you error ocuur, execute make test.
RUN cd /usr/local/gnucobol && ./configure
RUN cd /usr/local/gnucobol && make
RUN cd /usr/local/gnucobol && make install
# dynamic lib path connect for gnucobol
RUN echo export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib >> ~/.bashrc
RUN su - vscode -c 'echo export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/local/lib >> ~/.bashrc'
RUN source ~/.bashrc && ldconfig

# install pro cobol development environment
RUN wget https://download.oracle.com/otn_software/linux/instantclient/216000/oracle-instantclient-basic-21.6.0.0.0-1.el8.x86_64.rpm
RUN dnf install -y ./oracle-instantclient-basic-21.*.el8.x86_64.rpm
RUN rm ./oracle-instantclient-basic-21.*.el8.x86_64.rpm
RUN wget https://download.oracle.com/otn_software/linux/instantclient/216000/oracle-instantclient-devel-21.6.0.0.0-1.el8.x86_64.rpm
RUN dnf install -y ./oracle-instantclient-devel-21.*.el8.x86_64.rpm
RUN rm ./oracle-instantclient-devel-21.*.el8.x86_64.rpm
COPY oracle-instantclient-precomp-21.*.el8.x86_64.rpm .
RUN dnf install -y ./oracle-instantclient-precomp-21.*.el8.x86_64.rpm
RUN rm ./oracle-instantclient-precomp-21.*.el8.x86_64.rpm

# install development util.
RUN dnf install -y mlocate vim wget

# install .net runtime for using oracle.oracledevtools vscode extension.
RUN dnf install -y dotnet-runtime-6.0

# install sqlcl for connect db container 
RUN su - vscode -c 'wget https://download.oracle.com/otn_software/java/sqldeveloper/sqlcl-21.2.0.174.2245.zip'
RUN su - vscode -c 'unzip sqlcl-21.*.zip'
RUN su - vscode -c 'mv /home/vscode/sqlcl/bin/sql /home/vscode/sqlcl/bin/sqlcl'
RUN su - vscode -c 'rm sqlcl-21.*.zip'
RUN su - vscode -c 'echo export PATH=\$PATH:/home/vscode/sqlcl/bin >> ~/.bashrc'
RUN yum install -y java-11-openjdk.x86_64

# create function for sample
COPY db_sample.sh .
RUN chmod u+x ./db_sample.sh
RUN ./db_sample.sh
RUN rm db_sample.sh
# install for sample install sqlldr
RUN wget https://download.oracle.com/otn_software/linux/instantclient/216000/oracle-instantclient-tools-21.6.0.0.0-1.el8.x86_64.rpm
RUN dnf install -y ./oracle-instantclient-tools-21.*.el8.x86_64.rpm
RUN rm ./oracle-instantclient-tools-21.*.el8.x86_64.rpm
RUN su - vscode -c 'echo export PATH=\$PATH:/usr/lib/oracle/21/client64/bin >> ~/.bashrc'

# download scheme.spy
RUN su - vscode -c 'wget https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar'
RUN su - vscode -c 'mv schemaspy-*.jar schemaspy.jar'
RUN su - vscode -c 'wget https://download.oracle.com/otn-pub/otn_software/jdbc/215/ojdbc8-full.tar.gz'
RUN su - vscode -c 'tar zxvf ojdbc8-full.tar.gz'
RUN su - vscode -c 'rm ojdbc8-full.tar.gz'
RUN dnf install -y graphviz

# schemaspy oracle java8 only support
COPY jre-8u*-linux-x64.tar.gz /home/vscode/
RUN su - vscode -c 'tar zxvf jre-8u*-linux-x64.tar.gz -C /home/vscode --strip-components 1'
RUN su - vscode -c 'rm jre-8u*-linux-x64.tar.gz'
RUN su - vscode -c 'mv /home/vscode/bin/java /home/vscode/bin/java8'
RUN su - vscode -c 'echo export PATH=\$PATH:/home/vscode/bin >> ~/.bashrc'
