program ToHopPascal;
uses crt;
var
    C: array[0..30, 0..30] of longint;
    n, k, i, j: integer;

begin
    clrscr;
    write('Nhap n va k (0 <= k <= n <= 30): ');
    readln(n, k);
    
    { Xay dung tam giac Pascal }
    for i := 0 to n do
    begin
        C[i, 0] := 1;
        C[i, i] := 1;
        for j := 1 to i - 1 do
            C[i, j] := C[i - 1, j - 1] + C[i - 1, j];
    end;
    
    writeln('C(', n, ', ', k, ') = ', C[n, k]);
    readln;
end.