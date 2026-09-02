program DichChuyenMang;
uses crt;
var
    A, B: array[1..100] of integer;
    n, k, i, newPos: integer;
begin
    clrscr;
    write('Nhap so phan tu N = '); readln(n);
    for i := 1 to n do
    begin
        write('A[', i, '] = ');
        readln(A[i]);
    end;
    
    write('Nhap so vi tri can dich sang trai K = '); readln(k);
    k := k mod n; { Phong truong hop K > N }
    
    { Dich chuyen mang }
    for i := 1 to n do
    begin
        newPos := i - k;
        if newPos <= 0 then newPos := newPos + n;
        B[newPos] := A[i];
    end;
    
    writeln('Mang sau khi dich sang trai ', k, ' vi tri:');
    for i := 1 to n do write(B[i], ' ');
    writeln;
    readln;
end.