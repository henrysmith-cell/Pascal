program LCA_BinaryLifting;
uses crt;
var
    adj: array[1..50, 1..50] of boolean;
    up: array[1..50, 0..10] of integer;
    depth: array[1..50] of integer;
    n, q, u, v, i, j, diff: integer;

procedure DFS(u, p, d: integer);
var v, j: integer;
begin
    depth[u] := d;
    up[u, 0] := p;
    for j := 1 to 6 do
        up[u, j] := up[up[u, j - 1], j - 1];
        
    for v := 1 to n do
        if adj[u, v] and (v <> p) then
            DFS(v, u, d + 1);
end;

function GetLCA(u, v: integer): integer;
var j: integer;
begin
    if depth[u] < depth[v] then
    begin
        j := u; u := v; v := j; { Đổi vị trí để depth[u] >= depth[v] }
    end;
    
    diff := depth[u] - depth[v];
    for j := 6 downto 0 do
        if (diff and (1 shl j)) <> 0 then u := up[u, j];
        
    if u = v then exit(u);
    
    for j := 6 downto 0 do
        if up[u, j] <> up[v, j] then
        begin
            u := up[u, j];
            v := up[v, j];
        end;
    GetLCA := up[u, 0];
end;

begin
    clrscr;
    write('Nhap so dinh N: '); readln(n);
    for u := 1 to n do for v := 1 to n do adj[u, v] := false;
    
    writeln('Nhap ', n - 1, ' canh cua cay (u v):');
    for i := 1 to n - 1 do begin readln(u, v); adj[u, v] := true; adj[v, u] := true; end;
    
    DFS(1, 1, 0);
    
    write('Nhap so truy van LCA Q: '); readln(q);
    for i := 1 to q do
    begin
        write('Nhap cap dinh (u v): '); readln(u, v);
        writeln('LCA(', u, ', ', v, ') = ', GetLCA(u, v));
    end;
    readln;
end.