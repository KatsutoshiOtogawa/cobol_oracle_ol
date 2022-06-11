-- 12C以上はPlugable database に接続していないとユーザーを作成できない。
ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER vscode IDENTIFIED BY "vscode" DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp;

-- databaseの停止以外の全権限を与える。
GRANT DBA TO vscode;
