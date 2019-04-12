program ProyectoBingo;
uses crt, varDefine, cardBoard, check, sendTeacher ;

var i,repp:byte;
begin
repeat

// Backend
    // Clear
    clearVector( mtzMatch );
    clearVector( el_sorteo );
    clearArray( Bingo ) ;
    clearVector( FillsV );
    clearVector( ColumnsV );
    clearArray( Map ) ;
    clearVar();

    // Create
    sorteo(35,el_sorteo);
    createCardBoard(Bingo);
    compareResult(el_sorteo, mtzMatch);
    makeAMap();

    //Checks
    checkFullCardBoard();
    checkFill(0,0);
    checkColumn(0,0);
    checkDiagonal();
    checkCorners();
    checkFullCardBoard();
    totalHits();

//  Fronted
    //printMap();

    TextColor( White );
    GotoXY( 50, 1 );
    writeln('! Este es su carton !');
    writeln;   writeln;

    TextColor( Yellow );
    GotoXY( 50, 3 );
    writeLn ('| B | I | N | G | O |');
    GotoXY( 50, 4 );
    writeLn('---------------------');

    //Implement CardBoard
    drawCardBoard(Bingo, mtzMatch);
    writeln;   writeln;

    TextColor( White );
    GotoXY( 46, 13 );
    writeln('!!! ! Este fue el sorteo !!! !');
    writeln;   writeln;

    //Implementar draw
    TextColor( Yellow );
    escribe_sorteo (35,el_sorteo);
    writeln;   writeln;

    //Implementar results
    TextColor( Green );
    write('Carton lleno: ');
    TextColor( Yellow );
    if bandCheckFull = false then writeln('No')
    else writeln('Si');

    TextColor( Green );
    write('Total aciertos: ');
    TextColor( Yellow );
    writeln(hits);
    writeLn();

    TextColor( Green );
    write('Numero de filas acertadas: ');
    TextColor( Yellow );
         writeln(numFills);

    TextColor( Green );

    write('La(s) Fila(s) acertada(s) fue(ron): ');
    TextColor( Yellow ) ;
    if (Not fillBand) then write('No')
    else
     for i := 1 to 5 do
            if(FillsV[i] = 1) then write( i,',');
     writeln();     writeln();
    TextColor( Green ) ;

    write('Numero de columnas acertadas: ');
    TextColor( Yellow );
        writeln(numColumns);
    TextColor( Green );

    write('La(s) column(as) acertada(s) fue(ron): ');
    TextColor( Yellow );
        if Not (columnBand) then write('No')
        else
        for i := 1 to 5 do
            if(ColumnsV[i] = 1) then write( i,', ');
        writeln();        writeln();
    TextColor( Green );


    write('Diagonal(es) Acertada(s): ');
    TextColor( Yellow );
        if Not (bandMainDiagonal) And Not (bandSecondaryDiagonal)
           then write('Ninguna');
        if(bandMainDiagonal)then write('Diagonal Principal, ');
        if(bandSecondaryDiagonal)then write('Diagonal Secundaria, ');
        writeln();
    TextColor( Green );

    write('Cuatro esquinas acertadas: ');
    TextColor( Yellow );
    if (not bandCorners) then writeln('No')
    else writeln('Si');

    TextColor( White );
    write('Presione 1 para salir, otro para reiniciar: ');
    readln(repp);
    clrScr;

until repp = 1 ;
    exit();
end.

