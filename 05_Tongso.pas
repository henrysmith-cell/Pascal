program TinhTongDaySo;
uses crt;
var
    n, i: integer;
    S: real;
begin
    clrscr;
    write('Nhap n = ');
    readln(n);
    
    S := 0;
    for i := 1 to n do
        S := S + 1 / i;
        
    writeln('Tong S = ', S:0:4);
    readln;
end.