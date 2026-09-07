program LCS_DynamicProgramming;
uses crt;
var
    S1, S2: string;
    LCS: array[0..100, 0..100] of integer;
    i, j, m, n: integer;

function Max(a, b: integer): integer;
begin
    if a > b then Max := a else Max := b;
end;

begin
    clrscr;
    write('Nhap xau S1: '); readln(S1);
    write('Nhap xau S2: '); readln(S2);
    
    m := length(S1);
    n := length(S2);
    
    { Khoi tao bang Quy hoach dong }
    for i := 0 to m do LCS[i, 0] := 0;
    for j := 0 to n do LCS[0, j] := 0;
    
    for i := 1 to m do
        for j := 1 to n do
        begin
            if S1[i] = S2[j] then
                LCS[i, j] := LCS[i - 1, j - 1] + 1
            else
                LCS[i, j] := Max(LCS[i - 1, j], LCS[i, j - 1]);
        end;
        
    writeln('Do dai xau con chung dai nhat: ', LCS[m, n]);
    readln;
end.