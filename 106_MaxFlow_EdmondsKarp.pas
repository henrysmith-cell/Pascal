program MaxFlow_EdmondsKarp;
uses crt;
var
    C, F: array[1..50, 1..50] of longint;
    parent, queue: array[1..50] of integer;
    n, m, s, t, u, v, i, head, tail, pushFlow, maxFlow: integer;
    w: longint;
    foundPath: boolean;

function Min(a, b: longint): longint;
begin
    if a < b then Min := a else Min := b;
end;

function BFS(s, t: integer): boolean;
var u, v: integer;
begin
    for u := 1 to n do parent[u] := 0;
    parent[s] := -1;
    head := 1; tail := 1; queue[1] := s;
    
    while head <= tail do
    begin
        u := queue[head]; inc(head);
        for v := 1 to n do
        begin
            if (parent[v] = 0) and (C[u, v] - F[u, v] > 0) then
            begin
                parent[v] := u;
                if v = t then exit(true);
                inc(tail); queue[tail] := v;
            end;
        end;
    end;
    exit(false);
end;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    write('Nhap dinh phat S va dinh thu T: '); readln(s, t);
    
    for u := 1 to n do for v := 1 to n do begin C[u, v] := 0; F[u, v] := 0; end;
    
    writeln('Nhap danh sach canh (u v TrongSo):');
    for i := 1 to m do
    begin
        readln(u, v, w);
        C[u, v] := w;
    end;
    
    maxFlow := 0;
    while BFS(s, t) do
    begin
        pushFlow := 1000000;
        v := t;
        while v <> s do
        begin
            u := parent[v];
            pushFlow := Min(pushFlow, C[u, v] - F[u, v]);
            v := u;
        end;
        
        v := t;
        while v <> s do
        begin
            u := parent[v];
            F[u, v] := F[u, v] + pushFlow;
            F[v, u] := F[v, u] - pushFlow;
            v := u;
        end;
        maxFlow := maxFlow + pushFlow;
    end;
    
    writeln('LUONG CUC DAI TU ', s, ' DEN ', t, ' = ', maxFlow);
    readln;
end.