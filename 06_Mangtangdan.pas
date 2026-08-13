program SapXepMang;
uses crt;
var
    A: array[1..100] of integer;
    n, i, j, temp: integer;
begin
    clrscr;
    write('Nhap so phan tu N = ');
    readln(n);
    
    for i := 1 to n do
    begin
        write('A[', i, '] = ');
        readln(A[i]);
    end;
    
    { Thuat toan Sap xep tang dan }
    for i := 1 to n - 1 do
        for j := i + 1 to n do
            if A[i] > A[j] then
            begin
                temp := A[i];
                A[i] := A[j];
                A[j] := temp;
            end;
            
    writeln('Mang sau khi sap xep tang dan:');
    for i := 1 to n do
        write(A[i], ' ');
    writeln;
    readln;
end.