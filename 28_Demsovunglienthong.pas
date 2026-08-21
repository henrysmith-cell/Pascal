program DemSoDaoDFS;
uses crt;
var
    A: array[1..50, 1..50] of integer;
    visited: array[1..50, 1..50] of boolean;
    m, n, i, j, soDao: integer;
    dx: array[1..4] of integer = (-1, 1, 0, 0);
    dy: array[1..4] of integer = (0, 0, -1, 1);

procedure DFS(x, y: integer);
var
    k, u, v: integer;
begin
    visited[x, y] := true;
    for k := 1 to 4 do
    begin
        u := x + dx[k];
        v := y + dy[k];
        if (u >= 1) and (u <= m) and (v >= 1) and (v <= n) then
            if (A[u, v] = 1) and (not visited[u, v]) then
                DFS(u, v);
    end;
end;

begin
    clrscr;
    write('Nhap kich thuoc M va N: '); readln(m, n);
    writeln('Nhap ma tran (1: dat liền, 0: nuoc):');
    for i := 1 to m do
        for j := 1 to n do
        begin
            read(A[i, j]);
            visited[i, j] := false;
        end;
        
    soDao := 0;
    for i := 1 to m do
        for j := 1 to n do
        begin
            if (A[i, j] = 1) and (not visited[i, j]) then
            begin
                inc(soDao);
                DFS(i, j);
            end;
        end;
        
    writeln('So hon dao tren ban do la: ', soDao);
    readln;
end.