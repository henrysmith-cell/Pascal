program SegmentTree_LazyPropagation;
uses crt;
var
    tree, lazy: array[1..400] of longint;
    n, q, i, typeOp, l, r, val: integer;

procedure Push(node, start, finish: integer);
var mid: integer;
begin
    if lazy[node] <> 0 then
    begin
        mid := (start + finish) div 2;
        tree[2 * node] := tree[2 * node] + lazy[node] * (mid - start + 1);
        lazy[2 * node] := lazy[2 * node] + lazy[node];
        
        tree[2 * node + 1] := tree[2 * node + 1] + lazy[node] * (finish - mid);
        lazy[2 * node + 1] := lazy[2 * node + 1] + lazy[node];
        
        lazy[node] := 0;
    end;
end;

procedure UpdateRange(node, start, finish, l, r, val: integer);
var mid: integer;
begin
    if (r < start) or (finish < l) then exit;
    if (l <= start) and (finish <= r) then
    begin
        tree[node] := tree[node] + val * (finish - start + 1);
        lazy[node] := lazy[node] + val;
        exit;
    end;
    
    Push(node, start, finish);
    mid := (start + finish) div 2;
    UpdateRange(2 * node, start, mid, l, r, val);
    UpdateRange(2 * node + 1, mid + 1, finish, l, r, val);
    tree[node] := tree[2 * node] + tree[2 * node + 1];
end;

function QuerySum(node, start, finish, l, r: integer): longint;
var mid: integer;
begin
    if (r < start) or (finish < l) then exit(0);
    if (l <= start) and (finish <= r) then exit(tree[node]);
    
    Push(node, start, finish);
    mid := (start + finish) div 2;
    QuerySum := QuerySum(2 * node, start, mid, l, r) + QuerySum(2 * node + 1, mid + 1, finish, l, r);
end;

begin
    clrscr;
    write('Nhap N va so truy van Q: '); readln(n, q);
    for i := 1 to 4 * n do begin tree[i] := 0; lazy[i] := 0; end;
    
    writeln('Thao tac (1: Cong [L..R] val | 2: Tong [L..R]):');
    for i := 1 to q do
    begin
        read(typeOp);
        if typeOp = 1 then
        begin
            readln(l, r, val);
            UpdateRange(1, 1, n, l, r, val);
            writeln('Da cong ', val, ' vao doan [', l, '..', r, ']');
        end
        else
        begin
            readln(l, r);
            writeln('Tong doan [', l, '..', r, '] = ', QuerySum(1, 1, n, l, r));
        end;
    end;
    readln;
end.