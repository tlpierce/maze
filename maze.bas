1 REM MAZE GENERATOR IN BASIC
2 REM JOE WINGBERMUEHLE
10 PRINT "WIDTH (MUST BE ODD)";:INPUT W
20 PRINT "HEIGHT (MUST BE ODD)";:INPUT H
30 PRINT "SEED";:INPUT S
40 DIM M(W,H)
50 FOR Y=1 TO H
60 FOR X=1 TO W
70 M(X,Y)=0:NEXT
80 M(1,Y)=2:M(W,Y)=2
90 NEXT
100 FOR X=1 TO W
110 M(X,1)=2:M(X,H)=2
120 NEXT:M(3,3)=1
130 F=((W-3)/2)*((H-3)/2)-1
140 FOR SY=3 TO H-2 STEP 2
150 FOR SX=3 TO W-2 STEP 2
160 GOSUB 300:NEXT:NEXT
170 IF F>0 GOTO 140
180 M(2,3)=1:M(W-1,H-2)=1
190 FOR Y=1 TO H
200 FOR X=1 TO W
210 IF M(X,Y)=0 GOTO 230
220 PRINT "  ";:GOTO 240
230 PRINT "[]";
240 NEXT:PRINT:NEXT:END
300 X=SX:Y=SY
310 IF M(X,Y)<>1 THEN RETURN
320 GOTO 440
330 ON D GOTO 360,380,400,420
340 IF I=4 THEN RETURN
350 D=((D+1) AND 3)+1:I=I+1:GOTO 330
360 IF M(X+1,Y)+M(X+2,Y) GOTO 340
370 M(X+1,Y)=1:X=X+2:GOTO 440
380 IF M(X-1,Y)+M(X-2,Y) GOTO 340
390 M(X-1,Y)=1:X=X-2:GOTO 440
400 IF M(X,Y+1)+M(X,Y+2) GOTO 340
410 M(X,Y+1)=1:Y=Y+2:GOTO 440
420 IF M(X,Y-1)+M(X,Y-2) GOTO 340
430 M(X,Y-1)=1:Y=Y-2
440 I=0:D=INT(RND(S)*4)+1
450 IF M(X,Y)=0 THEN F=F-1
460 M(X,Y)=1:GOTO 330
