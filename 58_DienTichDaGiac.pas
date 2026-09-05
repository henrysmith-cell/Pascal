program DienTichDaGiac;
uses crt;
var
    X, Y: array[1..100] of real;
    n, i: integer;
    area: real;
begin
    clrscr;
    write('Nhap so dinh cua da giac N (N >= 3): '); readln(n);
    
    for i := 1 to n do
    begin
        write('Nhap toan do dinh ', i, ' (X Y): ');
        readln(X[i], Y[i]);
    end;
    
    area := 0;
    for i := 1 to n - 1 do
        area := area + (X[i] * Y[i + 1] - X[i + 1] * Y[i]);
        
    { Cong them cap dinh cuoi va dinh dau }
    area := area + (X[n] * Y[1] - X[1] * Y[n]);
    area := abs(area) / 2.0;
    
    writeln('Dien tich da giac la: ', area:0:2);
    readln;
end.