program LuongCucDai_EdmondsKarp;
uses crt;
const INF = 1000000;
var
    capacity, flow: array[1..50, 1..50] of integer;
    parent, queue: array[1..50] of integer;
    n, m, s, t, u, v, c, i, maxFlow, newFlow, curr, p: integer;

function BFS(s, t, n: integer): integer;
var
    visited: array[1..50] of boolean;
    front, rear, u, v: integer;
begin
    for u := 1 to n do
    begin
        visited[u] := false; parent[u] := -1;
    end;
    
    front := 1; rear := 1; queue[1] := s; visited[s] := true;
    while front <= rear do
    begin
        u := queue[front]; inc(front);
        for v := 1 to n do
            if (not visited[v]) and (capacity[u, v] - flow[u, v] > 0) then
            begin
                parent[v] := u;
                visited[v] := true;
                inc(rear); queue[rear] := v;
                if v = t then break;
            end;
    end;
    if visited[t] then BFS := 1 else BFS := 0;
end;

begin
    clrscr;
    write('Nhap so dinh N, so canh M, Dinh nguon S, Dinh dich T: ');
    readln(n, m, s, t);
    
    for u := 1 to n do for v := 1 to n do begin capacity[u, v] := 0; flow[u, v] := 0; end;
    
    writeln('Nhap danh sach canh (u v kha_nang_thong_qua):');
    for i := 1 to m do
    begin
        readln(u, v, c);
        capacity[u, v] := c;
    end;
    
    maxFlow := 0;
    while BFS(s, t, n) = 1 do
    begin
        newFlow := INF;
        curr := t;
        while curr <> s do
        begin
            p := parent[curr];
            if capacity[p, curr] - flow[p, curr] < newFlow then
                newFlow := capacity[p, curr] - flow[p, curr];
            curr := p;
        end;
        
        curr := t;
        while curr <> s do
        begin
            p := parent[curr];
            flow[p, curr] := flow[p, curr] + newFlow;
            flow[curr, p] := flow[curr, p] - newFlow;
            curr := p;
        end;
        maxFlow := maxFlow + newFlow;
    end;
    
    writeln('GIA TRI LUONG CUC DAI S -> T: ', maxFlow);
    readln;
end.