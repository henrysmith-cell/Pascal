program Kruskal_MST;
uses crt;
type
    Edge = record u, v, w: integer; end;
var
    edges: array[1..200] of Edge;
    parent: array[1..50] of integer;
    n, m, i, j, mstWeight, count: integer;
    temp: Edge;

function Find(i: integer): integer;
begin
    if parent[i] = i then exit(i);
    parent[i] := Find(parent[i]);
    Find := parent[i];
end;

procedure UnionSets(i, j: integer);
var rootI, rootJ: integer;
begin
    rootI := Find(i); rootJ := Find(j);
    if rootI <> rootJ then parent[rootI] := rootJ;
end;

begin
    clrscr;
    write('Nhap so dinh N va so canh M: '); readln(n, m);
    writeln('Nhap danh sach canh (u v w):');
    for i := 1 to m do readln(edges[i].u, edges[i].v, edges[i].w);
    
    { Sap xep cac canh theo trong so w tang dan }
    for i := 1 to m - 1 do
        for j := i + 1 to m do
            if edges[i].w > edges[j].w then
            begin
                temp := edges[i]; edges[i] := edges[j]; edges[j] := temp;
            end;
            
    for i := 1 to n do parent[i] := i;
    
    mstWeight := 0; count := 0;
    writeln('CAC CANH THUOC CAY KHUNG NHO NHAT:');
    for i := 1 to m do
    begin
        if Find(edges[i].u) <> Find(edges[i].v) then
        begin
            UnionSets(edges[i].u, edges[i].v);
            writeln('Canh (', edges[i].u, ' - ', edges[i].v, ') trong so: ', edges[i].w);
            mstWeight := mstWeight + edges[i].w;
            inc(count);
            if count = n - 1 then break;
        end;
    end;
    
    writeln('TONG TRONG SO CAY KHUNG NHO NHAT: ', mstWeight);
    readln;
end.