program TimGiaTriXuatHienNhieuNhat;
uses crt;
var
    A: array[1..100] of integer;
    freq: array[1..1000] of integer;
    n, i, maxFreq, bestValue: integer;
begin
    clrscr;
    write('Nhap N = '); readln(n);
    
    for i := 1 to 1000 do freq[i] := 0;
    
    for i := 1 to n do
    begin
        write('A[', i, '] = '); readln(A[i]);
        inc(freq[A[i]]);
    end;
    
    maxFreq := 0;
    bestValue := A[1];
    
    for i := 1 to 1000 do
    begin
        if freq[i] > maxFreq then
        begin
            maxFreq := freq[i];
            bestValue := i;
        end;
    end;
    
    writeln('Gia tri xuất hien nhieu nhat: ', bestValue);
    writeln('So lan xuat hien: ', maxFreq);
    readln;
end.