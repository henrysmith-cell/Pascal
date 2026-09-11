program KMP_StringMatching;
uses crt;
var
    T, P: string;
    pi: array[1..200] of integer;
    n, m, i, j: integer;

procedure BuildPrefixFunction(P: string; m: integer);
var i, j: integer;
begin
    pi[1] := 0; j := 0;
    for i := 2 to m do
    begin
        while (j > 0) and (P[i] <> P[j + 1]) do j := pi[j];
        if P[i] = P[j + 1] then inc(j);
        pi[i] := j;
    end;
end;

begin
    clrscr;
    write('Nhap xau van ban T: '); readln(T);
    write('Nhap xau mau P: '); readln(P);
    
    n := length(T); m := length(P);
    BuildPrefixFunction(P, m);
    
    j := 0;
    writeln('CAC VI TRI XUAT HIEN CUA P TRONG T:');
    for i := 1 to n do
    begin
        while (j > 0) and (T[i] <> P[j + 1]) do j := pi[j];
        if T[i] = P[j + 1] then inc(j);
        if j = m then
        begin
            writeln('Tim thay tai chi so: ', i - m + 1);
            j := pi[j];
        end;
    end;
    readln;
end.