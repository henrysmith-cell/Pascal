program SoHoanHao;
uses crt;
var
    n: integer;

{ Ham kiem tra so hoan hao }
function KiemTraHoanHao(x: integer): boolean;
var
    i, tong: integer;
begin
    tong := 0;
    for i := 1 to x - 1 do
    begin
        if x mod i = 0 then
            tong := tong + i;
    end;
    
    if tong = x then
        KiemTraHoanHao := true
    else
        KiemTraHoanHao := false;
end;

begin
    clrscr;
    write('Nhap n = ');
    readln(n);
    
    if (n > 0) and KiemTraHoanHao(n) then
        writeln(n, ' la so hoan hao.')
    else
        writeln(n, ' khong phai la so hoan hao.');
        
    readln;
end.