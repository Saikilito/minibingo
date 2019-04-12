unit check;

{$mode objfpc}{$H+}

interface
uses
    varDefine;

Procedure makeAMap();
Procedure printMap();
Procedure checkFill(iC, jC :byte);
Procedure checkColumn(iC, jC :byte);
Procedure checkDiagonal();
Procedure checkCorners();
Procedure checkFullCardBoard();
Procedure totalHits();

implementation

Procedure makeAMap();
var i , j : byte;
begin
     for i := 0 to 4 do
              for j := 0 to 4 do
                   if( mtzMatch[ Bingo[i][j] ] = 1 )
                       then Map [i][j] := 1;
     Map[2][2] := 1;
end;

Procedure printMap();
var i, j : byte;
begin
     //Print
     for i := 0 to 4 do
     begin
              for j := 0 to 4 do
                   write(Map[i][j],' |');
              writeln();
     end;
end;

Procedure checkFill(iC, jC :byte);
var i,j, count :byte;
begin
     for i := iC to 4 do
     begin
              count := 0 ;
              for j := jC to 4 do
              begin

                  if( Map [i][j] = 1) then inc(count)
                  else count := 0 ;

                  //Si consigo 5 validacones seguidas
                  if (count = 5) then
                  begin
                    //Aumento las filas conseguidas
                    inc(numFills);
                    //Anoto el indice donde esta
                    indexFill := i + 1 ;
                    FillsV[indexFill] := 1  ;
                    count := 0;
                    fillBand := true;
{
                    if ( i = 4 )then
                    begin
                         fillBand := true;
                         break;
                    end
                    //Sino busca en las otras filas
                    else
                    begin
                         checkFill(i+1,j+1);
                    end;
}
                 end;
              end;
     end;
end;

Procedure checkColumn(iC, jC :byte);
var i,j, count :byte;
begin
    for i := iC to 4 do
     begin
          count := 0 ;
          for j := jC to 4 do
          begin
              if( Map [j][i] = 1) then inc(count)
              else count := 0 ;
              //Si consigo 5 validacones seguidas
              if (count = 5) then
              begin
                //Aumento las columnas conseguidas
                inc(numColumns);
                //Anoto el indice donde esta
                indexColumn := i + 1 ;
                ColumnsV[indexColumn] := 1  ;
                count := 0;
                ColumnBand := true ;
                //Si ya estoy en la ultima
                if ( i = 4 )then
                begin
                     ColumnBand := true;
                     break;
                end
                //Sino busca en las otras columnas
                else
                begin
                     checkColumn(i+1,j+1);
                end;
               end;
          end;
     end;
end;

Procedure checkDiagonal();
begin
     if(Map[0][0] <> 0) And (Map[1][1] <> 0)
          And (Map[3][3] = 1) And (Map[4][4] = 1)
              then bandMainDiagonal := true
     else bandMainDiagonal := false;

     if(Map[0][4] <> 0) And (Map[1][3] <> 0)
          And (Map[3][1] = 1) And (Map[4][0] = 1)
              then bandSecondaryDiagonal := true
     else bandSecondaryDiagonal := false;

end;

Procedure checkCorners();
begin
     if(Map[0][0] = 1) and (Map[0][4] = 1)
        and (Map[4][0] = 1) and (Map[4][4] = 1) then
            begin
                 bandCorners := true ;
            end;
end;

Procedure checkFullCardBoard();
var i, j : byte ;
begin
     for i:=0 to 4 do
         for j:=0 to 4 do
             if (Map[i][j] = 0 ) then bandCheckFull := false      ;
end;

Procedure totalHits();
begin
     if columnBand then inc(hits);
     if fillBand then inc(hits);
     if bandMainDiagonal then inc(hits);
     if bandSecondaryDiagonal then inc(hits);
     if bandCorners then inc(hits);
end;

end.

