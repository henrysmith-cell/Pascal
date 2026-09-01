program DemDuongDiLui;
uses crt;
var
    DP: array[1..50, 1..50] of int64;
    m, n, i, j: integer;
begin
    clrscr;
    write('Nhap so hang M va so cot N: '); readln(m, n);
    
    { Khoi tao hang 1 va cot 1 chi co 1 cach đi }
    for i := 1 to m do DP[i, 1] := 1;
    for j := 1 to n do DP[1, j] := 1;
    
    { Quy hoach dong }
    for i := 2 to m do
        for j := 2 to n do
            DP[i, j] := DP[i - 1, j] + DP[i, j - 1];
            
    writeln('So duong di tu (1,1) den (', m, ',', n, ') la: ', DP[m, n]);
    readln;
end.