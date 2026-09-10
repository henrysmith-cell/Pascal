program ChuTrinhEuler;
uses crt;
var
    adj: array[1..50, 1..50] of integer;
    stack, path: array[1..500] of integer;
    top, pathSize, n, m, u, v, i: integer;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    
    for u := 1 to n do
        for v := 1 to n do adj[u, v] := 0;
        
    writeln('Nhap danh sach canh (u v):');
    for i := 1 to m do
    begin
        readln(u, v);
        inc(adj[u, v]);
        inc(adj[v, u]);
    end;
    
    top := 1; stack[top] := 1; { Bat dau tu dinh 1 }
    pathSize := 0;
    
    while top > 0 do
    begin
        u := stack[top];
        v := 1;
        while (v <= n) and (adj[u, v] = 0) do inc(v);
        
        if v <= n then
        begin
            dec(adj[u, v]); dec(adj[v, u]); { Xoa canh }
            inc(top); stack[top] := v;
        end
        else
        begin
            inc(pathSize);
            path[pathSize] := u;
            dec(top);
        end;
    end;
    
    writeln('CHU TRINH EULER:');
    for i := pathSize downto 1 do
        write(path[i], ' ');
    writeln;
    
    readln;
end.