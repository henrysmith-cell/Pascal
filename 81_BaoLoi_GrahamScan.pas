program BaoLoi_GrahamScan;
uses crt;
type
    Point = record x, y: real; end;
var
    p, stack: array[1..100] of Point;
    n, i, j, top, minIdx: integer;
    temp: Point;

function CrossProduct(o, a, b: Point): real;
begin
    CrossProduct := (a.x - o.x)*(b.y - o.y) - (a.y - o.y)*(b.x - o.x);
end;

function DistSq(a, b: Point): real;
begin
    DistSq := (a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y);
end;

begin
    clrscr;
    write('Nhap so diem N (N >= 3): '); readln(n);
    for i := 1 to n do readln(p[i].x, p[i].y);
    
    { Tim diem co tung do nho nhat (neu bang thi lay hoanh do nho nhat) }
    minIdx := 1;
    for i := 2 to n do
        if (p[i].y < p[minIdx].y) or ((p[i].y = p[minIdx].y) and (p[i].x < p[minIdx].x)) then
            minIdx := i;
            
    temp := p[1]; p[1] := p[minIdx]; p[minIdx] := temp;
    
    { Sap xep cac diem theo goc cuc so voi p[1] }
    for i := 2 to n - 1 do
        for j := i + 1 to n do
        begin
            if (CrossProduct(p[1], p[i], p[j]) < 0) or 
               ((CrossProduct(p[1], p[i], p[j]) = 0) and (DistSq(p[1], p[i]) > DistSq(p[1], p[j]))) then
            begin
                temp := p[i]; p[i] := p[j]; p[j] := temp;
            end;
        end;
        
    stack[1] := p[1]; stack[2] := p[2]; top := 2;
    for i := 3 to n do
    begin
        while (top >= 2) and (CrossProduct(stack[top-1], stack[top], p[i]) <= 0) do dec(top);
        inc(top); stack[top] := p[i];
    end;
    
    writeln('CAC DIEM THUOC BAO LOI:');
    for i := 1 to top do
        writeln('(', stack[i].x:0:1, ', ', stack[i].y:0:1, ')');
    readln;
end.