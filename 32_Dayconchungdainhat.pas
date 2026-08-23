program LongestCommonSubsequence;
uses crt;
var
    A, B: string;
    L: array[0..100, 0..100] of integer;
    i, j, lenA, lenB: integer;

function Max(x, y: integer): integer;
begin
    if x > y then Max := x else Max := y;
end;

begin
    clrscr;
    write('Nhap xau A: '); readln(A);
    write('Nhap xau B: '); readln(B);
    
    lenA := length(A);
    lenB := length(B);
    
    { Khoi tao bang Quy hoach dong }
    for i := 0 to lenA do
        for j := 0 to lenB do
            if (i = 0) or (j = 0) then
                L[i, j] := 0
            else if A[i] = B[j] then
                L[i, j] := L[i - 1, j - 1] + 1
            else
                L[i, j] := Max(L[i - 1, j], L[i, j - 1]);
                
    writeln('Do dai day con chung dai nhat la: ', L[lenA, lenB]);
    readln;
end.