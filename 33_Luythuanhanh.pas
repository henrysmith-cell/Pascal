program LuyThuaNhanh;
uses crt;
var
    a, b, m: int64;

{ Ham tinh (a^b) mod m bang luy thua nhanh }
function PowerMod(a, b, m: int64): int64;
var
    res: int64;
begin
    res := 1;
    a := a mod m;
    while b > 0 do
    begin
        if (b mod 2 = 1) then
            res := (res * a) mod m;
        a := (a * a) mod m;
        b := b div 2;
    end;
    PowerMod := res;
end;

begin
    clrscr;
    write('Nhap a, b, m (a^b mod m): ');
    readln(a, b, m);
    
    writeln('Ket qua ', a, '^', b, ' mod ', m, ' = ', PowerMod(a, b, m));
    readln;
end.