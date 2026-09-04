program InTamGiacPascal;
uses crt;
var
    P: array[1..20, 1..20] of longint;
    n, i, j: integer;
begin
    clrscr;
    write('Nhap so hang N = '); readln(n);
    
    for i := 1 to n do
    begin
        P[i, 1] := 1;
        P[i, i] := 1;
        for j := 2 to i - 1 do
            P[i, j] := P[i - 1, j - 1] + P[i - 1, j];
    end;
    
    writeln('TAM GIAC PASCAL:');
    for i := 1 to n do
    begin
        for j := 1 to i do
            write(P[i, j]:6);
        writeln;
    end;
    
    readln;
end.