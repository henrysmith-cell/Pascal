program SegmentTree_MaxQuery;
uses crt;
var
    A: array[1..100] of integer;
    tree: array[1..400] of integer;
    n, q, i, l, r: integer;

function Max(a, b: integer): integer;
begin
    if a > b then Max := a else Max := b;
end;

procedure BuildTree(node, start, finish: integer);
var mid: integer;
begin
    if start = finish then
        tree[node] := A[start]
    else
    begin
        mid := (start + finish) div 2;
        BuildTree(2 * node, start, mid);
        BuildTree(2 * node + 1, mid + 1, finish);
        tree[node] := Max(tree[2 * node], tree[2 * node + 1]);
    end;
end;

function QueryMax(node, start, finish, l, r: integer): integer;
var mid, p1, p2: integer;
begin
    if (r < start) or (finish < l) then exit(-1000000);
    if (l <= start) and (finish <= r) then exit(tree[node]);
    
    mid := (start + finish) div 2;
    p1 := QueryMax(2 * node, start, mid, l, r);
    p2 := QueryMax(2 * node + 1, mid + 1, finish, l, r);
    QueryMax := Max(p1, p2);
end;

begin
    clrscr;
    write('Nhap so phan tu N = '); readln(n);
    writeln('Nhap mangan A:');
    for i := 1 to n do read(A[i]);
    
    BuildTree(1, 1, n);
    
    write('Nhap so truy van Q = '); readln(q);
    for i := 1 to q do
    begin
        write('Nhap doan [L, R]: '); readln(l, r);
        writeln('Gia tri Max doan [', l, '..', r, '] = ', QueryMax(1, 1, n, l, r));
    end;
    readln;
end.