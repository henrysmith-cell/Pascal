program TimMaxInMang;
uses crt;
var
    A: array[1..100] of integer;
    n, i, max, viTri: integer;
begin
    clrscr;
    write('Nhap so luong phan tu N = ');
    readln(n);
    
    { Nhap mang }
    for i := 1 to n do
    begin
        write('A[', i, '] = ');
        readln(A[i]);
    end;
    
    { Tim Max }
    max := A[1];
    viTri := 1;
    for i := 2 to n do
    begin
        if A[i] > max then
        begin
            max := A[i];
            viTri := i;
        end;
    end;
    
    writeln('Gia tri lon nhat la: ', max);
    writeln('Xuat hien dau tien tai vi tri: ', viTri);
    readln;
end.