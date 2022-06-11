# conbol program for modern engineer

## warning

gnucobol(opencobol) is gcc. not *cobol compiler*.
gnucobol cobol file read and execute gcc compile and output binary.

but gnucobol is majar and only free cobol environment.

## prepare

- docker
- vscode

### download from oracle site

[oracle java8](https://www.oracle.com/java/technologies/downloads/)
download jre-8u333-linux-x64.tar.gz to .devcontainer/

[pro cobol client](https://www.oracle.com/database/technologies/instant-client/precompiler-downloads.html)
download oracle-instantclient-precomp-21.6.0.0.0-1.el8.x86_64.rpm to .devcontainer/

### vscode extension

install

- ms-azuretools.vscode-docker

## how to launch

Click on the >< symbol in the lower left corner,
.devcontainer launch from vscode 

The oracle database takes time to start up, so please wait 20 minutes.

## compile

```bash
# compile and output executable binary file.
cobc -x src/hello.cob
# compile and output executable binary file(specific output folder).
cobc -x src/hello.cob -o out/bin/hello
# compile and output linux share library.
cobc src/hello.cob -o out/lib/hello.so
```

## procob

Info procob is not support on rhel.

```bash
# output .lis and .cob for inernal output. build
procob src/hello.cob 
```

[](https://docs.oracle.com/cd/E57425_01/121/LNPCB/toc.htm)

[oracle procob document](https://docs.oracle.com/en/database/oracle/oracle-database/21/pcbrn/index.html#PCBRN-GUID-4FD340C4-3519-40AC-8119-16B142D2EFDC)

## biggner for lesson

[gnu cobol document](https://gnucobol.sourceforge.io/doc/gnucobol.html)
[cobol sample](https://github.com/Apress/beg-cobol-for-programmers)

[cobol example opensource](https://github.com/opensourcecobol/opensource-cobol-devel)

## create er figure

```bash
# execute in same folder exits schemaspy.peroperties
java8 -jar /home/vscode/schemaspy.jar
java8 -jar /home/vscode/schemaspy.jar -dbhelp
```

## install sample development data

```bash
enable_sampleschema
```

SELECT
    JOB_ID,
    JOB_TITLE,
    MIN_SALARY,
    MAX_SALARY
FROM
    HR.JOBS
WHERE
    JOB_ID = 'AD_PRES';
