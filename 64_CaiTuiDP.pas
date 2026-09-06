program CaiTuiDP;
uses crt;
var
    W, V: array[1..100] of integer;
    DP: array[0..100, 0..1000] of integer;
    n, M, i, j: integer;

function Max(a, b: integer): integer;
begin
    if a > b then Max := a else Max := b;
end;

begin
    clrscr;
    write('Nhap so do vat N = '); readln(n);
    write('Nhap trong luong toi da cua tui M = '); readln(M);
    
    writeln('Nhap trong luong (W) va gia tri (V) cua tung do vat:');
    for i := 1 to n do
    begin
        write('Do vat ', i, ' (W V): ');
        readln(W[i], V[i]);
    end;
    
    { Quy hoach dong }
    for i := 0 to n do
        for j := 0 to M do DP[i, j] := 0;
        
    for i := 1 to n do
    begin
        for j := 0 to M do
        begin
            DP[i, j] := DP[i - 1, j]; { Khong chon do vat i }
            if (j >= W[i]) and (DP[i - 1, j - W[i]] + V[i] > DP[i, j]) then
                DP[i, j] := DP[i - 1, j - W[i]] + V[i]; { Chon do vat i }
        end;
    end;
    
    writeln('Gia tri lon nhat co the dat duoc: ', DP[n, M]);
    readln;
end.