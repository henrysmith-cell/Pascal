program SinhNhiPhan;
uses crt;
var
    A: array[1..20] of integer;
    n, i: integer;
    stop: boolean;

procedure InDach;
var
    j: integer;
begin
    for j := 1 to n do write(A[j]);
    writeln;
end;

procedure SinhTiep;
var
    i: integer;
begin
    i := n;
    while (i > 0) and (A[i] = 1) do
    begin
        A[i] := 0;
        dec(i);
    end;
    if i = 0 then
        stop := true
    else
        A[i] := 1;
end;

begin
    clrscr;
    write('Nhap N = '); readln(n);
    
    for i := 1 to n do A[i] := 0;
    stop := false;
    
    writeln('Tat ca cac day nhi phan do dai ', n, ':');
    while not stop do
    begin
        InDach;
        SinhTiep;
    end;
    
    readln;
end.