program TreeDP_SubtreeSize;
uses crt;
var
    adj: array[1..100, 1..100] of boolean;
    subSize: array[1..100] of integer;
    visited: array[1..100] of boolean;
    n, u, v, i: integer;

procedure DFS(u: integer);
var v: integer;
begin
    visited[u] := true;
    subSize[u] := 1; { Moi dinh ban dau co kich thuoc la 1 }
    
    for v := 1 to n do
    begin
        if adj[u, v] and (not visited[v]) then
        begin
            DFS(v);
            subSize[u] := subSize[u] + subSize[v]; { Cong kich thuoc cay con }
        end;
    end;
end;

begin
    clrscr;
    write('Nhap so dinh N cua cay: '); readln(n);
    for u := 1 to n do for v := 1 to n do adj[u, v] := false;
    
    writeln('Nhap ', n - 1, ' canh cua cay (u v):');
    for i := 1 to n - 1 do
    begin
        readln(u, v);
        adj[u, v] := true; adj[v, u] := true;
    end;
    
    for i := 1 to n do visited[i] := false;
    DFS(1);
    
    writeln('KICH THUOC CAY CON TAI MOI DINH:');
    for i := 1 to n do
        writeln('Dinh ', i, ': Subtree size = ', subSize[i]);
    readln;
end.