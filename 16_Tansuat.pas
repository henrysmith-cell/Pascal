program DemTanSuat;
uses crt;
var
    A: array[1..100] of integer;
    count: array[1..1000] of integer; { Mang danh dau tan suat }
    n, i, maxVal: integer;
begin
    clrscr;
    write('Nhap so phan tu N = ');
    readln(n);
    
    { Khoi tao mang count bang 0 }
    for i := 1 to 1000 do
        count[i] := 0;
        
    maxVal := 0;
    for i := 1 to n do
    begin
        write('A[', i, '] = ');
        readln(A[i]);
        count[A[i]] := count[A[i]] + 1; { Tang tan suat cua gia tri A[i] }
        if A[i] > maxVal then
            maxVal := A[i];
    end;
    
    writeln;
    writeln('--- Tan suat xuat hien ---');
    for i := 1 to maxVal do
    begin
        if count[i] > 0 then
            writeln('Gia tri ', i, ' xuat hien ', count[i], ' lan.');
    end;
    
    readln;
end.