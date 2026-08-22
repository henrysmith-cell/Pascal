program DijkstraShortestPath;
uses crt;
const
    INF = 1000000;
var
    W: array[1..50, 1..50] of longint;
    dist: array[1..50] of longint;
    visited: array[1..50] of boolean;
    n, m, s, i, j, u, v, w_val, minDist, nextNode: integer;

begin
    clrscr;
    write('Nhap so dinh N va so cung M: '); readln(n, m);
    
    { Khoi tao ma tran trong so }
    for i := 1 to n do
        for j := 1 to n do
            if i = j then W[i, j] := 0 else W[i, j] := INF;
            
    writeln('Nhap danh sach cac cung (u v w):');
    for i := 1 to m do
    begin
        readln(u, v, w_val);
        W[u, v] := w_val;
    end;
    
    write('Nhap dinh nguon S = '); readln(s);
    
    { Khoi tao Dijkstra }
    for i := 1 to n do
    begin
        dist[i] := W[s, i];
        visited[i] := false;
    end;
    dist[s] := 0;
    visited[s] := true;
    
    { Thuat toan Dijkstra }
    for i := 1 to n - 1 do
    begin
        minDist := INF;
        nextNode := -1;
        for j := 1 to n do
            if (not visited[j]) and (dist[j] < minDist) then
            begin
                minDist := dist[j];
                nextNode := j;
            end;
            
        if nextNode = -1 then break;
        visited[nextNode] := true;
        
        for j := 1 to n do
            if (not visited[j]) and (dist[nextNode] + W[nextNode, j] < dist[j]) then
                dist[j] := dist[nextNode] + W[nextNode, j];
    end;
    
    writeln('Khoang cach ngan nhat tu dinh ', s, ':');
    for i := 1 to n do
    begin
        if dist[i] = INF then
            writeln('Den dinh ', i, ': Khong co duong di')
        else
            writeln('Den dinh ', i, ': ', dist[i]);
    end;
    
    readln;
end.