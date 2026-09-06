program DiemTrongTamGiac;
uses crt;
var
    xA, yA, xB, yB, xC, yC, xP, yP: real;
    S_ABC, S_PAB, S_PBC, S_PCA: real;

function DienTich(x1, y1, x2, y2, x3, y3: real): real;
begin
    DienTich := abs(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) / 2.0;
end;

begin
    clrscr;
    writeln('Nhap toan do 3 dinh A, B, C:');
    write('A(x, y): '); readln(xA, yA);
    write('B(x, y): '); readln(xB, yB);
    write('C(x, y): '); readln(xC, yC);
    
    write('Nhap toan do diem P(x, y): '); readln(xP, yP);
    
    S_ABC := DienTich(xA, yA, xB, yB, xC, yC);
    S_PAB := DienTich(xP, yP, xA, yA, xB, yB);
    S_PBC := DienTich(xP, yP, xB, yB, xC, yC);
    S_PCA := DienTich(xP, yP, xC, yC, xA, yA);
    
    { Dung sai nho do sai so so thuc }
    if abs(S_ABC - (S_PAB + S_PBC + S_PCA)) < 0.0001 then
        writeln('Diem P NAM TRONG (hoac tren canh) tam giac ABC!')
    else
        writeln('Diem P NAM NGOAI tam giac ABC!');
        
    readln;
end.