program KiemTraSoNguyenTo;
uses crt;
var
    n, i, dem: integer;
begin
    clrscr;
    write('Nhap so nguyen duong n = ');
    readln(n);
    
    if n < 2 then
        writeln(n, ' khong phai la so nguyen to.')
    else
    begin
        dem := 0;
        for i := 1 to n do
        begin
            if n mod i = 0 then
                dem := dem + 1;
        end;
        
        if dem = 2 then
            writeln(n, ' la so nguyen to.')
        else
            writeln(n, ' khong phai la so nguyen to.');
    end;
    readln;
end.