program TransitiveClosure_Warshall;
uses crt;
var
    reach: array[1..50, 1..50] of boolean;
    n, m, u, v, i, k: integer;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    
    for u := 1 to n do
        for v := 1 to n do reach[u, v] := (u = v);
        
    writeln('Nhap danh sach canh co huong (u v):');
    for i := 1 to m do
    begin
        readln(u, v);
        reach[u, v] := true;
    end;
    
    { Thuat toan Warshall }
    for k := 1 to n do
        for u := 1 to n do
            for v := 1 to n do
                reach[u, v] := reach[u, v] or (reach[u, k] and reach[k, v]);
                
    writeln('MA TRAN TAI TINH (BAO DONG CHUYEN TIEP):');
    for u := 1 to n do
    begin
        for v := 1 to n do
            if reach[u, v] then write('1 ') else write('0 ');
        writeln;
    end;
    
    readln;
end.