program SegmentTree2D_Max;
uses crt;
var
    A: array[1..20, 1..20] of integer;
    tree: array[1..80, 1..80] of integer;
    m, n, q, i, x1, y1, x2, y2: integer;

function Max(a, b: integer): integer;
begin
    if a > b then Max := a else Max := b;
end;

procedure BuildY(nodeX, startX, finishX, nodeY, startY, finishY: integer);
var midY: integer;
begin
    if startY = finishY then
    begin
        if startX = finishX then
            tree[nodeX, nodeY] := A[startX, startY]
        else
            tree[nodeX, nodeY] := Max(tree[2 * nodeX, nodeY], tree[2 * nodeX + 1, nodeY]);
    end;
    if startY <> finishY then
    begin
        midY := (startY + finishY) div 2;
        BuildY(nodeX, startX, finishX, 2 * nodeY, startY, midY);
        BuildY(nodeX, startX, finishX, 2 * nodeY + 1, midY + 1, finishY);
        tree[nodeX, nodeY] := Max(tree[nodeX, 2 * nodeY], tree[nodeX, 2 * nodeY + 1]);
    end;
end;

procedure BuildX(nodeX, startX, finishX: integer);
var midX: integer;
begin
    if startX <> finishX then
    begin
        midX := (startX + finishX) div 2;
        BuildX(2 * nodeX, startX, midX);
        BuildX(2 * nodeX + 1, midX + 1, finishX);
    end;
    BuildY(nodeX, startX, finishX, 1, 1, n);
end;

function QueryY(nodeX, nodeY, startY, finishY, y1, y2: integer): integer;
var midY, p1, p2: integer;
begin
    if (y2 < startY) or (finishY < y1) then exit(-1000000);
    if (y1 <= startY) and (finishY <= y2) then exit(tree[nodeX, nodeY]);
    
    midY := (startY + finishY) div 2;
    p1 := QueryY(nodeX, 2 * nodeY, startY, midY, y1, y2);
    p2 := QueryY(nodeX, 2 * nodeY + 1, midY + 1, finishY, y1, y2);
    QueryY := Max(p1, p2);
end;

function QueryX(nodeX, startX, finishX, x1, x2, y1, y2: integer): integer;
var midX, p1, p2: integer;
begin
    if (x2 < startX) or (finishX < x1) then exit(-1000000);
    if (x1 <= startX) and (finishX <= x2) then exit(QueryY(nodeX, 1, 1, n, y1, y2));
    
    midX := (startX + finishX) div 2;
    p1 := QueryX(2 * nodeX, startX, midX, x1, x2, y1, y2);
    p2 := QueryX(2 * nodeX + 1, midX + 1, finishX, x1, x2, y1, y2);
    QueryX := Max(p1, p2);
end;

begin
    clrscr;
    write('Nhap kich thuoc ma tran M N: '); readln(m, n);
    writeln('Nhap ma tran A:');
    for x1 := 1 to m do for y1 := 1 to n do read(A[x1, y1]);
    
    BuildX(1, 1, m);
    
    write('Nhap so truy van Q = '); readln(q);
    for i := 1 to q do
    begin
        write('Nhap x1 y1 x2 y2: '); readln(x1, y1, x2, y2);
        writeln('Max vung [', x1, ',', y1, '] -> [', x2, ',', y2, '] = ', QueryX(1, 1, m, x1, x2, y1, y2));
    end;
    readln;
end.