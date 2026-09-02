program DemTanSuat;
uses crt;
var
    A: array[1..100] of integer;
    visited: array[1..100] of boolean;
    n, i, j, count: integer;
begin
    clrscr;
    write('Nhap N = '); readln(n);
    for i := 1 to n do
    begin
        write('A[', i, '] = '); readln(A[i]);
        visited[i] := false;
    end;
    
    writeln('Ket qua dem tan suat:');
    for i := 1 to n do
    begin
        if not visited[i] then
        begin
            count := 1;
            for j := i + 1 to n do
            begin
                if A[i] = A[j] then
                begin
                    inc(count);
                    visited[j] := true;
                end;
            end;
            writeln('Gia tri ', A[i], ' xuat hien: ', count, ' lan.');
        end;
    end;
    
    readln;
end.