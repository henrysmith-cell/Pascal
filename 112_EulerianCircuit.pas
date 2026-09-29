program EulerianCircuit;
uses crt;
var
    adj: array[1..50, 1..50] of integer;
    deg: array[1..50] of integer;
    stack, path: array[1..200] of integer;
    topStack, topPath, n, m, u, v, i: integer;
    isValid: boolean;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    for u := 1 to n do for v := 1 to n do adj[u, v] := 0;
    for u := 1 to n do deg[u] := 0;
    
    writeln('Nhap danh sach canh (u v):');
    for i := 1 to m do
    begin
        readln(u, v);
        inc(adj[u, v]); inc(adj[v, u]);
        inc(deg[u]); inc(deg[v]);
    end;
    
    { Kiem tra dieu kien chu trinh Euler: Tat ca cac dinh deu co bac chan }
    isValid := true;
    for i := 1 to n do
        if deg[i] mod 2 <> 0 then isValid := false;
        
    if not isValid then
        writeln('Do thi KHONG co chu trinh Euler (co dinh bac le)!')
    else
    begin
        topStack := 1; stack[1] := 1;
        topPath := 0;
        
        while topStack > 0 do
        begin
            u := stack[topStack];
            v := 1;
            while (v <= n) and (adj[u, v] = 0) do inc(v);
            
            if v <= n then
            begin
                dec(adj[u, v]); dec(adj[v, u]);
                inc(topStack); stack[topStack] := v;
            end
            else
            begin
                inc(topPath); path[topPath] := u;
                dec(topStack);
            end;
        end;
        
        writeln('CHU TRINH EULER:');
        for i := topPath downto 1 do write(path[i], ' ');
        writeln;
    end;
    
    readln;
end.