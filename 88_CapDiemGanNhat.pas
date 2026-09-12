program CapDiemGanNhat;
uses crt;
type Point = record x, y: real; end;
var
    P: array[1..100] of Point;
    n, i, j: integer;
    minDist, d: real;

function Dist(a, b: Point): real;
begin
    Dist := sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y));
end;

function Min(a, b: real): real;
begin
    if a < b then Min := a else Min := b;
end;

{ Thuat toan Vetus/Brute-force cho doan nho }
function ClosestPair(l, r: integer): real;
var
    i, j, mid: integer;
    d, d1, d2: real;
begin
    if r - l <= 3 then
    begin
        d := 1e9;
        for i := l to r - 1 do
            for j := i + 1 to r do
                d := Min(d, Dist(P[i], P[j]));
        exit(d);
    end;
    
    mid := (l + r) div 2;
    d1 := ClosestPair(l, mid);
    d2 := ClosestPair(mid + 1, r);
    d := Min(d1, d2);
    
    { Kiem tra dải giua }
    for i := l to r do
        if abs(P[i].x - P[mid].x) < d then
            for j := i + 1 to r do
                if (P[j].x - P[mid].x < d) and (abs(P[i].y - P[j].y) < d) then
                    d := Min(d, Dist(P[i], P[j]));
                    
    ClosestPair := d;
end;

begin
    clrscr;
    write('Nhap so diem N: '); readln(n);
    writeln('Nhap toan do cac diem (x y):');
    for i := 1 to n do readln(P[i].x, P[i].y);
    
    minDist := ClosestPair(1, n);
    writeln('Khoang cach ngan nhat giua 2 diem: ', minDist:0:4);
    readln;
end.