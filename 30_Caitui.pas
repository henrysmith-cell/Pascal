program BaiToanCaiTui;
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
    write('Nhap khoi luong toi da M = '); readln(M);
    
    writeln('Nhap Khoi luong W va Gia tri V cho tung do vat:');
    for i := 1 to n do
    begin
        write('Do vat ', i, ' (W V): ');
        readln(W[i], V[i]);
    end;
    
    { Quy hoach dong 2 chieu }
    for i := 0 to n do
        for j := 0 to M do
        begin
            if (i = 0) or (j = 0) then
                DP[i, j] := 0
            else if W[i] <= j then
                DP[i, j] := Max(DP[i - 1, j], DP[i - 1, j - W[i]] + V[i])
            else
                DP[i, j] := DP[i - 1, j];
        end;
        
    writeln('Gia tri lon nhat co the mang theo: ', DP[n, M]);
    readln;
end.