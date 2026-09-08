program LuyThuaNhiPhan;
uses crt;

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

var
    a, b, m: int64;
begin
    clrscr;
    write('Nhap a, b, M (chach nhau bang dau cach): ');
    readln(a, b, m);
    
    writeln(a, '^', b, ' mod ', m, ' = ', PowerMod(a, b, m));
    readln;
end.