program PrimMST;
uses crt;
const
    INF = 1000000;
var
    W: array[1..50, 1..50] of longint;
    d: array[1..50] of longint;
    inMST: array[1..50] of boolean;
    n, m, u, v, w_val, i, j, minVal, uMin, totalWeight: integer;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    
    for i := 1 to n do
        for j := 1 to n do W[i, j] := INF;
        
    writeln('Nhap danh sach canh va trong so (u v w):');
    for i := 1 to m do
    begin
        readln(u, v, w_val);
        W[u, v] := w_val;
        W[v, u] := w_val;
    end;
    
    for i := 1 to n do
    begin
        d[i] := INF;
        inMST[i] := false;
    end;
    
    d[1] := 0;
    totalWeight := 0;
    
    for i := 1 to n do
    begin
        minVal := INF;
        uMin := -1;
        for j := 1 to n do
            if (not inMST[j]) and (d[j] < minVal) then
            begin
                minVal := d[j];
                uMin := j;
            end;
            
        if uMin = -1 then break;
        inMST[uMin] := true;
        totalWeight := totalWeight + minVal;
        
        for j := 1 to n do
            if (not inMST[j]) and (W[uMin, j] < d[j]) then
                d[j] := W[uMin, j];
    end;
    
    writeln('Tong trong so Cay khung nho nhat: ', totalWeight);
    readln;
end.