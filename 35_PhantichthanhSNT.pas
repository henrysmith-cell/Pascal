program PhanTichThuaSoNguyenTo;
uses crt;
var
    n, d: longint;
    first: boolean;
begin
    clrscr;
    write('Nhap so nguyen duong N (N > 1) = ');
    readln(n);
    
    write(n, ' = ');
    d := 2;
    first := true;
    
    while n > 1 do
    begin
        if n mod d = 0 then
        begin
            if not first then write(' * ') else first := false;
            write(d);
            n := n div d;
        end
        else
            inc(d);
    end;
    
    writeln;
    readln;
end.