program GiaoDiemHaiDuongThang;
uses crt;
var
    A1, B1, C1, A2, B2, C2: real;
    D, Dx, Dy, x, y: real;
begin
    clrscr;
    writeln('Nhap he so duong thang D1 (A1 B1 C1):');
    readln(A1, B1, C1);
    writeln('Nhap he so duong thang D2 (A2 B2 C2):');
    readln(A2, B2, C2);
    
    { Tinh cac dinh thuc Cramer }
    D  := A1 * B2 - A2 * B1;
    Dx := C1 * B2 - C2 * B1;
    Dy := A1 * C2 - A2 * C1;
    
    if abs(D) < 1e-6 then
    begin
        if (abs(Dx) < 1e-6) and (abs(Dy) < 1e-6) then
            writeln('Hai duong thang TRUNG NHAU!')
        else
            writeln('Hai duong thang SONG SONG voi nhau!');
    end
    else
    begin
        x := Dx / D;
        y := Dy / D;
        writeln('Giao diem P(x, y) = (', x:0:2, ', ', y:0:2, ')');
    end;
    
    readln;
end.