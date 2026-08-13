program UCLN_BCNN;
uses crt;
var
    a, b, x, y, ucln, bcnn: longint;
begin
    clrscr;
    write('Nhap a va b: ');
    readln(a, b);
    
    x := a;
    y := b;
    
    { Thuat toan Euclid tim UCLN }
    while y <> 0 do
    begin
        ucln := x mod y;
        x := y;
        y := ucln;
    end;
    ucln := x;
    
    { Cong thuc BCNN = (a * b) / UCLN }
    bcnn := (a * b) div ucln;
    
    writeln('UCLN (', a, ', ', b, ') = ', ucln);
    writeln('BCNN (', a, ', ', b, ') = ', bcnn);
    readln;
end.