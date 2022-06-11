    *****************************************************************
        IDENTIFICATION              DIVISION.
        PROGRAM-ID.                 SAMPLE-13.
    *****************************************************************
        ENVIRONMENT                 DIVISION.
    *****************************************************************
        DATA                        DIVISION.
        WORKING-STORAGE             SECTION.
        01 A                        PIC 9(5).
        01 B                        PIC ZZZZ9.
        01 C                        PIC S9(5).
        01 D                        PIC X(5).
    
        01 WRK-NUMBER               PIC 9(5).
        01 WRK-STRING               PIC X(5).

    **** データの初期値設定
        01 WRK-NUMBER2              PIC 9(5) VALUE 67890.
        01 WRK-STRING2              PIC X(5) VALUE "WXYZ".
    **** データ項目
    **** 構造体に見えるが、タダの変数。
        01 WRK-DATA                 VALUE "12345ABCDE".
           13 WRK-ITEM1             PIC 9(5).
           13 WRK-ITEM2             PIC X(5).
    **** 各データに入れる。
        01 WRK-DATA2                 VALUE "12345ABCDE".
           03 WRK-ITEM11             PIC 9(5).
           03 WRK-ITEM22             PIC X(5).
        EXEC SQL BEGIN DECLARE SECTION END-EXEC. 
         01 EMP-NAME    PIC X(20) VARYING.
         01 EMP-NUMBER  PIC S9(4) COMP VALUE ZERO.
         01 SALARY      PIC S9(5)V99 COMP-3 VALUE ZERO.
         01 DEPT-NUMBER PIC S9(4) COMP VALUE ZERO.
     EXEC SQL END DECLARE SECTION END-EXEC. 
    *****************************************************************
        PROCEDURE                   DIVISION.
        MAIN.
           MOVE 100                 TO A B C.
           MOVE "00100"             TO D.

           DISPLAY "A[ " A "]".
           DISPLAY "B[ " B "]".
           DISPLAY "C[ " C "]".
           DISPLAY "D[ " D "]".

    **** 表意定数
           MOVE ZERO                TO WRK-NUMBER.
    **** 変数をすべて空白文字で埋める。
           MOVE SPACE               TO WRK-STRING.

           DISPLAY "WRK-NUMBER[" WRK-NUMBER "]".
           DISPLAY "WRK-STRING[" WRK-STRING "]".
    **** データ項目
           STOP RUN.
