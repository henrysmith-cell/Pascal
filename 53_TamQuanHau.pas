program TamQuanHau;
uses crt;
var
    X: array[1..20] of integer;
    col, diag1, diag2: array[-20..40] of boolean;
    n, i: integer;
    found: boolean;

procedure Backtrack(i: integer);
var
    j: integer;
begin
    for j := 1 to n do
    begin
        if (not col[j]) and (not diag1[i - j]) and (not diag2[i + j]) then
        begin
            X[i] := j;
            col[j] := true;
            diag1[i - j] := true;
            diag2[i + j] := true;
            
            if i = n then
            begin
                found := true;
                exit;
            end
            else
                Backtrack(i + 1);
                
            if found then exit;
            
            { Quay lui }
            col[j] := false;
            diag1[i - j] := false;
            diag2[i + j] := false;
        end;
    end;
end;

begin
    clrscr;
    write('Nhap kích thuoc ban co N = '); readln(n);
    
    for i := -20 to 40 do
    begin
        col[i] := false;
        diag1[i] := false;
        diag2[i] := false;
    end;
    found := false;
    
    Backtrack(1);
    
    if found then
    begin
        writeln('Vi tri dat quan hau o moi hang (cot tuong ung):');
        for i := 1 to n do
            writeln('Hang ', i, ' -> Cot ', X[i]);
    end
    else
        writeln('Khong tim thay loi giai!');
        
    readln;
end.