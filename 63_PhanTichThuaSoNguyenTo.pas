program PhanTichThuaSoNguyenTo;
uses crt;
var
    n, temp, d, count: longint;
    isFirst: boolean;
begin
    clrscr;
    write('Nhap N (N >= 2): '); readln(n);
    
    temp := n;
    d := 2;
    isFirst := true;
    write(n, ' = ');
    
    while d * d <= temp do
    begin
        if temp mod d = 0 then
        begin
            count := 0;
            while temp mod d = 0 do
            begin
                inc(count);
                temp := temp div d;
            end;
            
            if not isFirst then write(' * ') else isFirst := false;
            write(d, '^', count);
        end;
        inc(d);
    end;
    
    if temp > 1 then
    begin
        if not isFirst then write(' * ');
        write(temp, '^1');
    end;
    
    writeln;
    readln;
end.