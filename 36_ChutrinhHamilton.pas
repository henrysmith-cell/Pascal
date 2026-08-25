program ChuTrinhHamilton;
uses crt;
var
    A: array[1..20, 1..20] of boolean;
    X: array[1..20] of integer;
    visited: array[1..20] of boolean;
    n, m, u, v, i: integer;
    found: boolean;

procedure TryHamilton(i: integer);
var
    j: integer;
begin
    if found then exit;
    for j := 1 to n do
    begin
        if A[X[i-1], j] and (not visited[j]) then
        begin
            X[i] := j;
            visited[j] := true;
            
            if i = n then
            begin
                if A[X[n], X[1]] then
                begin
                    found := true;
                    write('Tim thay chu trinh Hamilton: ');
                    for var k := 1 to n do write(X[k], ' -> ');
                    writeln(X[1]);
                end;
            end
            else
                TryHamilton(i + 1);
                
            visited[j] := false;
        end;
    end;
end;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    
    for u := 1 to n do
        for v := 1 to n do A[u, v] := false;
        
    writeln('Nhap danh sach cac canh (u v):');
    for i := 1 to m do
    begin
        readln(u, v);
        A[u, v] := true;
        A[v, u] := true;
    end;
    
    for i := 1 to n do visited[i] := false;
    
    X[1] := 1;
    visited[1] := true;
    found := false;
    
    TryHamilton(2);
    
    if not found then
        writeln('Do thi khong co chu trinh Hamilton.');
        
    readln;
end.