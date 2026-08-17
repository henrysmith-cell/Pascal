program DoiTienThamAn;
uses crt;
const
    menGia: array[1..9] of integer = (500, 200, 100, 50, 20, 10, 5, 2, 1);
var
    S, i, soTo, tongTo: integer;
begin
    clrscr;
    write('Nhap so tien can doi S = '); readln(S);
    
    tongTo := 0;
    writeln('Chi tiet cac to tien:');
    for i := 1 to 9 do
    begin
        if S >= menGia[i] then
        begin
            soTo := S div menGia[i];
            S := S mod menGia[i];
            tongTo := tongTo + soTo;
            writeln('- Men gia ', menGia[i], ': ', soTo, ' to');
        end;
    end;
    
    writeln('Tong so to tien it nhat: ', tongTo);
    readln;
end.