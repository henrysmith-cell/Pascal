program NhanSoLon;
uses crt;
var
    A, B: string;
    res: array[1..500] of integer;
    i, j, lenA, lenB, digitA, digitB, mul, carry: integer;
    ans: string;

begin
    clrscr;
    write('Nhap so lon A: '); readln(A);
    write('Nhap so lon B: '); readln(B);
    
    lenA := length(A);
    lenB := length(B);
    for i := 1 to lenA + lenB do res[i] := 0;
    
    for i := lenA downto 1 do
    begin
        digitA := ord(A[i]) - 48;
        for j := lenB downto 1 do
        begin
            digitB := ord(B[j]) - 48;
            mul := digitA * digitB + res[i + j];
            res[i + j] := mul mod 10;
            res[i + j - 1] := res[i + j - 1] + (mul div 10);
        end;
    end;
    
    ans := '';
    i := 1;
    while (i < lenA + lenB) and (res[i] = 0) do inc(i);
    for j := i to lenA + lenB do
        ans := ans + chr(res[j] + 48);
        
    writeln('Tich A * B = ', ans);
    readln;
end.