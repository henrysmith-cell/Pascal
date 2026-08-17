program NQueens;
uses crt;
var
    n: integer;
    x: array[1..20] of integer; { x[i] = j: Hau o hang i, cot j }
    cot, cheo1, cheo2: array[-20..40] of boolean;
    found: boolean;

procedure InKetQua;
var
    i, j: integer;
begin
    writeln('--- MOT PHUONG AN XEP HAU ---');
    for i := 1 to n do
    begin
        for j := 1 to n do
            if x[i] = j then write(' Q ') else write(' . ');
        writeln;
    end;
    found := true;
end;

procedure TryQueen(i: integer);
var
    j: integer;
begin
    if found then exit;
    for j := 1 to n do
    begin
        if cot[j] and cheo1[i - j] and cheo2[i + j] then
        begin
            x[i] := j;
            cot[j] := false; cheo1[i - j] := false; cheo2[i + j] := false;
            
            if i = n then InKetQua
            else TryQueen(i + 1);
            
            cot[j] := true; cheo1[i - j] := true; cheo2[i + j] := true;
        end;
    end;
end;

var
    i: integer;
begin
    clrscr;
    write('Nhap kich thuoc ban co N = '); readln(n);
    found := false;
    for i := -20 to 40 do
    begin
        cot[i] := true; cheo1[i] := true; cheo2[i] := true;
    end;
    
    TryQueen(1);
    if not found then writeln('Khong co phuong an xep!');
    readln;
end.