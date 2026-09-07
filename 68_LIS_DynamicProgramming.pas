program LIS_DynamicProgramming;
uses crt;
var
    A: array[1..100] of integer;
    L: array[1..100] of integer;
    n, i, j, maxLen: integer;
begin
    clrscr;
    write('Nhap N = '); readln(n);
    for i := 1 to n do
    begin
        write('A[', i, '] = '); readln(A[i]);
    end;
    
    maxLen := 1;
    for i := 1 to n do
    begin
        L[i] := 1; { Do dai toi thieu la 1 (chinh phan tu A[i]) }
        for j := 1 to i - 1 do
        begin
            if (A[j] < A[i]) and (L[j] + 1 > L[i]) then
                L[i] := L[j] + 1;
        end;
        if L[i] > maxLen then maxLen := L[i];
    end;
    
    writeln('Do dai day con tang dai nhat: ', maxLen);
    readln;
end.