program TinhHinhTron;
uses crt;
var
    r, chuVi, dienTich: real;
begin
    clrscr;
    write('Nhap ban kinh r = ');
    readln(r);
    
    chuVi := 2 * Pi * r;
    dienTich := Pi * r * r;
    
    writeln('Chu vi hinh tron: ', chuVi:0:2);
    writeln('Dien tich hinh tron: ', dienTich:0:2);
    readln;
end.