program DayConTangDaiNhat;
uses crt;
var
    A, L: array[1..100] of integer;
    n, i, j, maxL: integer;
begin
    clrscr;
    write('Nhap so phan tu N = '); readln(n);
    
    for i := 1 to n do
    begin
        write('A[', i, '] = ');
        readln(A[i]);
    end;
    
    { Quy hoach dong }
    maxL := 1;
    for i := 1 to n do
    begin
        L[i] := 1; { Do dai toi thieu la 1 (chinh no) }
        for j := 1 to i - 1 do
        begin
            if (A[j] < A[i]) and (L[j] + 1 > L[i]) then
                L[i] := L[j] + 1;
        end;
        if L[i] > maxL then
            maxL := L[i];
    end;
    
    writeln('Do dai day con tang dai nhat la: ', maxL);
    readln;
end.