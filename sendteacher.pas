unit sendTeacher;
{$mode objfpc}{$H+}

interface
 uses varDefine;

 Procedure sorteo (cantidad:byte; var vector:t1);
 Procedure Escribe_sorteo (cantidad:byte; vector:t1);
 Procedure OrdenarVector(Var V : T1);

 implementation
 Uses CRT;

 Procedure sorteo (cantidad:byte; var vector:t1);
 var
 llevo,numero,c,i:byte;
 begin
   Randomize;
   llevo:=0;
   Repeat
     numero:=random (75)+1;
     c:=0;
     For i:=1 to llevo do
       If (numero=vector [i] ) then inc (c);
     If (c=0) then begin
       inc (llevo);
       vector[llevo]:=numero;
     end;
   until (llevo=cantidad);

   OrdenarVector(vector);

 end;

 Procedure Escribe_sorteo (cantidad:byte; vector:t1);
 var
 A:T2;
 I:BYTE;
 X:CHAR;
 begin
   For i:=1 to cantidad do begin
     case vector [i] of
     1..15: x:='B';
     16..30: x:='I';
     31..45: x:='N';
     46..60: x:='G';
     61..75: x:='O';
     end;
     A[i]:=x;
   end;
   GotoXY( 5, 14 );
    For i:=1 to cantidad do
        write (A[i]:3);
    writeln;

    GotoXY( 5, 15 );
    write(' ');
    For i:=1 to cantidad do
     begin
       write (vector[i]:2,'|');
     end;
    writeln;
 end;

Procedure OrdenarVector(Var V : T1);
Var
   Band: boolean ;
   Aux  : Integer ;
   i    : byte ;

begin
     repeat
           Band := False ;
           for i := 35 DownTo 2 Do
           begin
                 if (V[i] < V[i-1]) Then
                 begin
                      Aux    := V[i] ;
                      V[i]   := V[i-1];
                      V[i-1] := Aux ;
                      Band := True ;
                 end;
           end;

     until Band = False;

end;

 begin
 end.
