program CapDiemGanNhat;
uses crt;

type
    Diem = record
        x, y: real;
    end;

var
    P: array[1..100] of Diem;
    n, i, j: integer;
    minDist, d: real;

function Distance(p1, p2: Diem): real;
begin
    Distance := sqrt(sqr(p1.x - p2.x) + sqr(p1.y - p2.y));
end;

begin
    clrscr;
    write('Nhap so diem N (N >= 2) = '); readln(n);
    
    for i := 1 to n do
    begin
        write('Nhap toa do diem ', i, ' (x y): ');
        readln(P[i].x, P[i].y);
    end;
    
    minDist := Distance(P[1], P[2]);
    
    for i := 1 to n - 1 do
        for j := i + 1 to n do
        begin
            d := Distance(P[i], P[j]);
            if d < minDist then
                minDist := d;
        end;
        
    writeln('Khoang cach nho nhat giua 2 diem la: ', minDist:0:4);
    readln;
end.