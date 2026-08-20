program TruSoLon;
uses crt;
var
    A, B, C: string;
    i, maxLen, nho, d1, d2, sub: integer;

begin
    clrscr;
    write('Nhap so lon A: '); readln(A);
    write('Nhap so lon B (B <= A): '); readln(B);
    
    maxLen := length(A);
    while length(B) < maxLen do B := '0' + B;
    
    C := '';
    nho := 0;
    
    for i := maxLen downto 1 do
    begin
        d1 := ord(A[i]) - 48;
        d2 := ord(B[i]) - 48;
        
        sub := d1 - d2 - nho;
        if sub < 0 then
        begin
            sub := sub + 10;
            nho := 1;
        end
        else
            nho := 0;
            
        C := chr(sub + 48) + C;
    end;
    
    { Xoa cac chu so 0 thua ở dau }
    while (length(C) > 1) and (C[1] = '0') do delete(C, 1, 1);
    
    writeln('Hieu A - B = ', C);
    readln;
end.