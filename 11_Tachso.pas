program TachChuSo;
uses crt;
var
    n, temp, chuSo, tong, maxChuSo: longint;
begin
    clrscr;
    write('Nhap so nguyen duong N = ');
    readln(n);
    
    temp := n;
    tong := 0;
    maxChuSo := 0;
    
    while temp > 0 do
    begin
        chuSo := temp mod 10; { Lay chu so cuoi cung }
        tong := tong + chuSo;
        
        if chuSo > maxChuSo then
            maxChuSo := chuSo;
            
        temp := temp div 10;  { Bỏ chu so cuoi cung }
    end;
    
    writeln('Tong cac chu so cua ', n, ' la: ', tong);
    writeln('Chu so lon nhat trong ', n, ' la: ', maxChuSo);
    readln;
end.