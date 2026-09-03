program MaTranDoiXung;
uses crt;
var
    A: array[1..20, 1..20] of integer;
    n, i, j: integer;
    isSymmetric: boolean;
begin
    clrscr;
    write('Nhap cap ma tran N = '); readln(n);
    
    for i := 1 to n do
        for j := 1 to n do
        begin
            write('A[', i, ',', j, '] = ');
            readln(A[i, j]);
        end;
        
    isSymmetric := true;
    for i := 1 to n do
        for j := i + 1 to n do
        begin
            if A[i, j] <> A[j, i] then
            begin
                isSymmetric := false;
                break;
            end;
        end;
        
    if isSymmetric then
        writeln('Day LA ma tran doi xung qua duong cheo chinh!')
    else
        writeln('Day KHONG PHAI la ma tran doi xung!');
        
    readln;
end.