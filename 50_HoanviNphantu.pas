program LietKeHoanVi;
uses crt;
var
    X: array[1..10] of integer;
    used: array[1..10] of boolean;
    n, i: integer;

procedure PrintResult;
var
    k: integer;
begin
    for k := 1 to n do write(X[k], ' ');
    writeln;
end;

procedure Backtrack(i: integer);
var
    j: integer;
begin
    for j := 1 to n do
    begin
        if not used[j] then
        begin
            X[i] := j;
            used[j] := true;
            
            if i = n then PrintResult
            else Backtrack(i + 1);
            
            used[j] := false; { Quay lui }
        end;
    end;
end;

begin
    clrscr;
    write('Nhap N (1 <= N <= 9): '); readln(n);
    
    for i := 1 to n do used[i] := false;
    
    writeln('Tat ca cac hoan vi cua ', n, ' phan tu:');
    Backtrack(1);
    readln;
end.