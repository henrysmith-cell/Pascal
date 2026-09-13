program Tarjan_SCC;
uses crt;
var
    adj: array[1..50, 1..50] of boolean;
    num, low: array[1..50] of integer;
    stack: array[1..100] of integer;
    inStack: array[1..50] of boolean;
    n, m, u, v, i, counter, top, sccCount: integer;

function Min(a, b: integer): integer;
begin
    if a < b then Min := a else Min := b;
end;

procedure Tarjan(u: integer);
var v, w: integer;
begin
    inc(counter); num[u] := counter; low[u] := counter;
    inc(top); stack[top] := u; inStack[u] := true;
    
    for v := 1 to n do
    begin
        if adj[u, v] then
        begin
            if num[v] = 0 then
            begin
                Tarjan(v);
                low[u] := Min(low[u], low[v]);
            end
            else if inStack[v] then
                low[u] := Min(low[u], num[v]);
        end;
    end;
    
    if low[u] = num[u] then
    begin
        inc(sccCount);
        write('TPLTM ', sccCount, ': ');
        repeat
            w := stack[top]; dec(top);
            inStack[w] := false;
            write(w, ' ');
        until w = u;
        writeln;
    end;
end;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    for u := 1 to n do for v := 1 to n do adj[u, v] := false;
    
    writeln('Nhap danh sach canh co huong (u v):');
    for i := 1 to m do begin readln(u, v); adj[u, v] := true; end;
    
    counter := 0; top := 0; sccCount := 0;
    for i := 1 to n do begin num[i] := 0; inStack[i] := false; end;
    
    writeln('DANH SACH CAC THANH PHAN LIEN THONG MANG:');
    for i := 1 to n do
        if num[i] = 0 then Tarjan(i);
    readln;
end.