unit cardBoard;
{$mode objfpc}{$H+}

interface
Uses varDefine;

Procedure createCardBoard(var Bingo:TM);
Procedure compareResult(el_sorteo:T1; var mtzMatch: T3);
Procedure drawCardBoard(Bingo:TM; mtzMatch:T3);

implementation
uses CRT;

Procedure createCardBoard(var Bingo:TM);
var i, j, numRand : byte;
    antiRepeat: T3;
begin
   Randomize;
   for i:= 0 to 75 do
       antiRepeat[i] := 0 ;

   for i := 0 to 4 do
        for j := 0 to 4 do
        begin
          repeat
             if j = 0
                   then numRand := random(15)+1
             else if j = 1
                   then numRand := random(15)+16
             else if j = 2
                   then numRand := random(15)+31
             else if j = 3
                   then numRand := random(15)+46
             else if j = 4
                   then numRand := random(15)+61;

             if (antiRepeat[numRand] = 0)  then
             begin
                  antiRepeat[numRand] := 1;
                  Bingo[i][j] := numRand;
             end;

          until (Bingo[i][j] <> 0) ;

        end;

        Bingo[2][2] := 0;

end;

Procedure compareResult(el_sorteo:T1; var mtzMatch: T3);
var i: byte;
begin
      for i:= 1 to 35 do
          mtzMatch[el_sorteo[i]] := 1 ;
end;

Procedure drawCardBoard(Bingo:TM; mtzMatch:T3);
var
i, j, cen : BYTE;
begin
    cen := 5;
    for i:=0 to 4 do
    begin
        GotoXY( 50, cen );
        inc(cen);
       TextColor( White ) ;
       write ('|')  ;

        for j:=0 to 4 do
        begin
             if( i = 2 ) And ( j = 2 ) then
             begin
                 TextColor( 13 ) ;
                 write(Bingo[i][j]);
             end
             else if( mtzMatch[ Bingo[i][j] ] = 1 )then
             begin
                TextColor( Green );
                write(Bingo[i][j]);
             end
             else
             begin
                TextColor( White ) ;
                write(Bingo[i][j]);
             end;

             TextColor( White ) ;

            if(Bingo[i][j] div 10 > 0)
              then write(' |')
            else write('  |');
        end;
        writeln();
    end;
   writeln;
end;

begin

end.

