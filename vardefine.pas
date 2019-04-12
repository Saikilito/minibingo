unit varDefine;

{$mode objfpc}{$H+}

interface
TYPE
    T1 = ARRAY [1..35] OF BYTE;
    T2 = ARRAY [1..50] OF CHAR;
    T3 = ARRAY [0..75] OF BYTE;
    T4 = ARRAY [1..5] OF byte;
    TM = Array [0..4,0..4] of BYTE;
var
   EL_SORTEO      : T1;
   mtzMatch       : T3;
   fillsV,
   ColumnsV       : T4;
   Map, Bingo     : TM;

   fillBand,
   columnBand,
   bandCorners,
   bandCheckFull,
   bandMainDiagonal,
   bandSecondaryDiagonal: boolean;

   numFills,
   indexFill,
   indexColumn,
   numColumns,
   hits           : Byte;

   count2         :LongInt;

Procedure clearVector(var V:T1);
Procedure clearVector(var V:T3);
Procedure clearVector(var V:T4);
Procedure clearArray(var A:TM);
Procedure clearVar();

implementation

Procedure clearVector(var V:T1);
var i: byte;
begin
  for i := 1 to 35 do
      V[i] := 0 ;
end;

Procedure clearVector(var V:T3);
var i: byte;
begin
  for i := 0 to 75 do
      V[i] := 0 ;
end;

Procedure clearVector(var V:T4);
var i: byte;
begin
  for i := 1 to 5 do
      V[i] := 0 ;
end;

Procedure clearArray(var A:TM);
var i, j : byte;
begin
  for i := 0 to 4 do
      for j:= 0 to 4 do
            A[i][j] := 0 ;
end;

Procedure clearVar();
begin
  columnBand := false;
  fillBand := false;
  bandMainDiagonal := false;
  bandSecondaryDiagonal:=false;
  bandCorners := false ;
  bandCheckFull := true ;

  hits := 0 ;
  numFills := 0;
  numColumns := 0 ;
  indexFill := 0 ;
  indexColumn := 0 ;
end;

begin
     clearVar();
end.

