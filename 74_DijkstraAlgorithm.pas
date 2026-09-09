program DijkstraAlgorithm;
uses crt;
const
    INF = 1000000;
var
    w: array[1..50, 1..50] of longint;
    dist: array[1..50] of longint;
    visited: array[1..50] of boolean;
    n, m, s, u, v, weight, i, count, minVal, minIdx: integer;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    
    for u := 1 to n do
        for v := 1 to n do
            if u = v then w[u, v] := 0 else w[u, v] := INF;
            
    writeln('Nhap danh sach canh (u v w):');
    for i := 1 to m do
    begin
        readln(u, v, weight);
        w[u, v] := weight;
    end;
    
    write('Nhap dinh nguon S = '); readln(s);
    
    for i := 1 to n do
    begin
        dist[i] := w[s, i];
        visited[i] := false;
    end;
    visited[s] := true;
    
    for count := 1 to n - 1 do
    begin
        minVal := INF; minIdx := -1;
        for i := 1 to n do
            if (not visited[i]) and (dist[i] < minVal) then
            begin
                minVal := dist[i];
                minIdx := i;
            end;
            
        if minIdx = -1 then break;
        visited[minIdx] := true;
        
        for v := 1 to n do
            if (not visited[v]) and (dist[minIdx] + w[minIdx, v] < dist[v]) then
                dist[v] := dist[minIdx] + w[minIdx, v];
    end;
    
    writeln('KHOANG CACH NGAN NHAT TU DINH ', s, ':');
    for i := 1 to n do
        if dist[i] = INF then
            writeln('Den dinh ', i, ': Khong co duong di')
        else
            writeln('Den dinh ', i, ': ', dist[i]);
            
    readln;
end.