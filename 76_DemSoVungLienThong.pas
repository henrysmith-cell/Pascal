program DemSoVungLienThong;
uses crt;
var
    A: array[1..50, 1..50] of integer;
    visited: array[1..50, 1..50] of boolean;
    m, n, i, j, count: integer;

procedure DFS(r, c: integer);
begin
    if (r < 1) or (r > m) or (c < 1) or (c > n) then exit;
    if (A[r, c] = 0) or visited[r, c] then exit;
    
    visited[r, c] := true;
    
    DFS(r - 1, c); { Tren }
    DFS(r + 1, c); { Duoi }
    DFS(r, c - 1); { Trai }
    DFS(r, c + 1); { Phai }
end;

begin
    clrscr;
    write('Nhap so hang M va so cot N: '); readln(m, n);
    
    writeln('Nhap ma tran nhi phan (0 va 1):');
    for i := 1 to m do
        for j := 1 to n do
        begin
            read(A[i, j]);
            visited[i, j] := false;
        end;
        
    count := 0;
    for i := 1 to m do
        for j := 1 to n do
            if (A[i, j] = 1) and (not visited[i, j]) then
            begin
                inc(count);
                DFS(i, j);
            end;
            
    writeln('So hung lien thong (so dao): ', count);
    readln; readln;
end.