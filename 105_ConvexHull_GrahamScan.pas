program ConvexHull_GrahamScan;
uses crt;
type
    Point = record x, y: longint; end;
var
    P, stack: array[1..200] of Point;
    n, i, j, top, minIdx: integer;
    temp, p0: Point;

function CrossProduct(o, a, b: Point): longint;
begin
    CrossProduct := (a.x - o.x) * (b.y - o.y) - (a.y - o.y) * (b.x - o.x);
end;

function DistSq(a, b: Point): longint;
begin
    DistSq := (a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y);
end;

begin
    clrscr;
    write('Nhap so diem N (N >= 3): '); readln(n);
    writeln('Nhap toa do các diem (x y):');
    for i := 1 to n do readln(P[i].x, P[i].y);
    
    { Tim diem duoi cung ben trái lam p0 }
    minIdx := 1;
    for i := 2 to n do
        if (P[i].y < P[minIdx].y) or ((P[i].y = P[minIdx].y) and (P[i].x < P[minIdx].x)) then
            minIdx := i;
            
    temp := P[1]; P[1] := P[minIdx]; P[minIdx] := temp;
    p0 := P[1];
    
    { Sap xep cac diem con lai theo goc cuc so voi p0 }
    for i := 2 to n - 1 do
        for j := i + 1 to n do
        begin
            if CrossProduct(p0, P[i], P[j]) < 0 then
            begin
                temp := P[i]; P[i] := P[j]; P[j] := temp;
            end
            else if CrossProduct(p0, P[i], P[j]) = 0 then
            begin
                if DistSq(p0, P[i]) > DistSq(p0, P[j]) then
                begin
                    temp := P[i]; P[i] := P[j]; P[j] := temp;
                end;
            end;
        end;
        
    stack[1] := P[1]; stack[2] := P[2]; stack[3] := P[3];
    top := 3;
    
    for i := 4 to n do
    begin
        while (top >= 2) and (CrossProduct(stack[top - 1], stack[top], P[i]) <= 0) do
            dec(top);
        inc(top); stack[top] := P[i];
    end;
    
    writeln('CAC DIEM THUOC BAO LOI:');
    for i := 1 to top do
        writeln('(', stack[i].x, ', ', stack[i].y, ')');
        
    readln;
end.