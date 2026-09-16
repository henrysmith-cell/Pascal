program HLD_Basic;
uses crt;
var
    adj: array[1..50, 1..50] of boolean;
    parent, depth, subSize, heavy, head, pos: array[1..50] of integer;
    n, u, v, i, curPos: integer;

procedure DFS(u, p, d: integer);
var v, maxSub, heavyChild: integer;
begin
    parent[u] := p; depth[u] := d;
    subSize[u] := 1; heavyChild := 0; maxSub := 0;
    
    for v := 1 to n do
        if adj[u, v] and (v <> p) then
        begin
            DFS(v, u, d + 1);
            subSize[u] := subSize[u] + subSize[v];
            if subSize[v] > maxSub then
            begin
                maxSub := subSize[v]; heavyChild := v;
            end;
        end;
    heavy[u] := heavyChild;
end;

procedure Decompose(u, h: integer);
var v: integer;
begin
    head[u] := h;
    inc(curPos); pos[u] := curPos;
    
    if heavy[u] <> 0 then
        Decompose(heavy[u], h); { Uu tien di theo canh nang (Heavy Edge) }
        
    for v := 1 to n do
        if adj[u, v] and (v <> parent[u]) and (v <> heavy[u]) then
            Decompose(v, v); { Bat dau xich nhe moi }
end;

begin
    clrscr;
    write('Nhap so dinh N: '); readln(n);
    for u := 1 to n do for v := 1 to n do adj[u, v] := false;
    
    writeln('Nhap ', n - 1, ' canh cua cay (u v):');
    for i := 1 to n - 1 do begin readln(u, v); adj[u, v] := true; adj[v, u] := true; end;
    
    DFS(1, 1, 0);
    curPos := 0;
    Decompose(1, 1);
    
    writeln('KET QUA PHAN RA CAY (HLD):');
    writeln('Dinh':6, ' | ', 'Head':6, ' | ', 'Vi tri tren mang phang (Pos)');
    writeln('------------------------------------------------');
    for i := 1 to n do
        writeln(i:6, ' | ', head[i]:6, ' | ', pos[i]:10);
        
    readln;
end.