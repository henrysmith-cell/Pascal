program DuyetBFS;
uses crt;
var
    adj: array[1..50, 1..50] of boolean;
    visited: array[1..50] of boolean;
    queue: array[1..100] of integer;
    front, rear, n, m, s, u, v, i: integer;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    
    for u := 1 to n do
        for v := 1 to n do adj[u, v] := false;
        
    writeln('Nhap danh sach canh (u v):');
    for i := 1 to m do
    begin
        readln(u, v);
        adj[u, v] := true;
        adj[v, u] := true;
    end;
    
    write('Nhap dinh bat dau BFS S = '); readln(s);
    
    for i := 1 to n do visited[i] := false;
    
    front := 1; rear := 1;
    queue[rear] := s;
    visited[s] := true;
    
    writeln('THU TU DUYET BFS:');
    while front <= rear do
    begin
        u := queue[front]; inc(front);
        write(u, ' ');
        
        for v := 1 to n do
        begin
            if adj[u, v] and (not visited[v]) then
            begin
                inc(rear);
                queue[rear] := v;
                visited[v] := true;
            end;
        end;
    end;
    
    writeln;
    readln;
end.