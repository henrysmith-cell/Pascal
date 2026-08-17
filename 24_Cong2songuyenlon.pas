program CongSoLon;
uses crt;
var
    A, B, C: string;
    i, lenA, lenB, maxLen, nho, d1, d2, sum: integer;

begin
    clrscr;
    write('Nhap so lon A: '); readln(A);
    write('Nhap so lon B: '); readln(B);
    
    { Can bang do dai 2 chuoi bang cach them '0' vao dau }
    lenA := length(A); lenB := length(B);
    if lenA > lenB then maxLen := lenA else maxLen := lenB;
    
    while length(A) < maxLen do A := '0' + A;
    while length(B) < maxLen do B := '0' + B;
    
    C := '';
    nho := 0;
    
    { Cong tu phai sang trai }
    for i := maxLen downto 1 do
    begin
        d1 := ord(A[i]) - 48;
        d2 := ord(B[i]) - 48;
        sum := d1 + d2 + nho;
        nho := sum div 10;
        C := chr((sum mod 10) + 48) + C;
    end;
    
    if nho > 0 then C := '1' + C;
    
    writeln('Tong A + B = ', C);
    readln;
end.