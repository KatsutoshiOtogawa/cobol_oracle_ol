#!/bin/bash

cat << END >> /home/vscode/.bashrc
# create sample from github
# reference from [Oraclesite: Database Sample Schemas](https://docs.oracle.com/en/database/oracle/oracle-database/18/comsc/lot.html)
# you want to know this script detail, go to https://github.com/oracle/db-sample-schemas.git
# necesallry sqlldr, sqlcl
function enable_sampleschema () {
    # sample respository is huge. get recent coomit only.
    git clone --depth 1 https://github.com/oracle/db-sample-schemas.git -b v21.1 \$HOME/db-sample-schemas
    local backdir=\$(pwd)
    cd \$HOME/db-sample-schemas
    # get release source
    perl -p -i.bak -e 's#__SUB__CWD__#'\$(pwd)'#g' *.sql */*.sql */*.dat
    # add exit for exiting sqlcl.
    echo '' >> mksample.sql
    echo 'exit' >> mksample.sql
    mkdir \$HOME/dbsamples
    sqlcl system/\${ORACLE_PWD}@db/XEPDB1 @mksample \$ORACLE_PWD \$ORACLE_PWD hrpw oepw pmpw ixpw shpw bipw users temp \$HOME/dbsamples/dbsamples.log db/XEPDB1
    # install OC schema
    cd customer_orders
    echo '' >> co_main.sql
    echo 'exit' >> co_main.sql
    sqlcl system/\${ORACLE_PWD}@db/XEPDB1 @co_main copw XEPDB1 users temp
    cd \$backdir >> /dev/null
    rm -rf \$HOME/db-sample-schemas
}

function disable_sampleschema () {
    # sample respository is huge. get recent coomit only.
    git clone --depth 1 https://github.com/oracle/db-sample-schemas.git -b v21.1 \$HOME/db-sample-schemas
    local backdir=\$(pwd)
    cd \$HOME/db-sample-schemas
    # get release source
    perl -p -i.bak -e 's#__SUB__CWD__#'\$(pwd)'#g' *.sql */*.sql */*.dat
    # add exit for exiting sqlcl.
    echo '' >> drop_sch.sql
    echo 'exit' >> drop_sch.sql
    sed -i "s/^DEFINE pwd_system/DEFINE pwd_system = \\'\$ORACLE_PWD\\'/" drop_sch.sql
    sed -i "s|^DEFINE spl_file|DEFINE spl_file = \\'\$HOME/dbsamples/drop_sch.log\\'|" drop_sch.sql
    sed -i "s/^DEFINE connect_string/DEFINE connect_string = 'XEPDB1'/" drop_sch.sql
    
    sqlcl system/\${ORACLE_PWD}@db/XEPDB1 @drop_sch
    cd customer_orders
    # add exit for exiting sqlcl.
    echo '' >> co_drop_user.sql
    echo 'exit' >> co_drop_user.sql
    sqlcl system/\${ORACLE_PWD}@db/XEPDB1 @co_drop_user 
    cd \$backdir >> /dev/null
    rm -rf \$HOME/db-sample-schemas
}

END
