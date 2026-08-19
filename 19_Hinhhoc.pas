program KiemTraDiemHinhHoc;
uses crt;

type
    Diem = record
        x, y: real;
    end;

var
    tam, M: Diem;
    R, d: real;

begin
    clrscr;
    write('Nhap toa do tam I (x0 y0): '); readln(tam.x, tam.y);
    write('Nhap ban kinh R = '); readln(R);
    write('Nhap toa do diem M (x y): '); readln(M.x, M.y);
    
    { Tinh khoang cach d = sqrt((x - x0)^2 + (y - y0)^2) }
    d := sqrt(sqr(M.x - tam.x) + sqr(M.y - tam.y));
    
    writeln('Khoang cach IM = ', d:0:2);
    
    if abs(d - R) < 0.0001 then
        writeln('Diem M NAM TREN duong tron.')
    else if d < R then
        writeln('Diem M NAM TRONG duong tron.')
    else
        writeln('Diem M NAM NGOAI duong tron.');
        
    readln;
end.