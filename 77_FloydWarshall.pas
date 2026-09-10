program FloydWarshall;
uses crt;
const
    INF = 1000000;
var
    dist: array[1..50, 1..50] of longint;
    n, m, u, v, w, i, k: integer;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    
    for u := 1 to n do
        for v := 1 to n do
            if u = v then dist[u, v] := 0 else dist[u, v] := INF;
            
    writeln('Nhap danh sach canh (u v w):');
    for i := 1 to m do
    begin
        readln(u, v, w);
        dist[u, v] := w;
    end;
    
    { Thuat toan Floyd-Warshall }
    for k := 1 to n do
        for u := 1 to n do
            for v := 1 to n do
                if (dist[u, k] < INF) and (dist[k, v] < INF) then
                    if dist[u, k] + dist[k, v] < dist[u, v] then
                        dist[u, v] := dist[u, k] + dist[k, v];
                        
    writeln('MA TRAN KHOANG CACH NGAN NHAT GIUA CAC CAP DINH:');
    for u := 1 to n do
    begin
        for v := 1 to n do
            if dist[u, v] = INF then write('INF':6) else write(dist[u, v]:6);
        writeln;
    end;
    
    readln;
end.