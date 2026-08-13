program KiemTraMaTranDoiXung;
uses crt;
var
    A: array[1..50, 1..50] of integer;
    n, i, j: integer;
    isDoiXung: boolean;
begin
    clrscr;
    write('Nhap cap cua ma tran vuong n = ');
    readln(n);
    
    writeln('Nhap cac phan tu cua ma tran:');
    for i := 1 to n do
        for j := 1 to n do
        begin
            write('A[', i, ',', j, '] = ');
            readln(A[i, j]);
        end;
        
    { Kiem tra tinh doi xung }
    isDoiXung := true;
    for i := 1 to n do
        for j := i + 1 to n do
        begin
            if A[i, j] <> A[j, i] then
            begin
                isDoiXung := false;
                break;
            end;
        end;
        
    if isDoiXung then
        writeln('Ma tran DA CHO la ma tran doi xung.')
    else
        writeln('Ma tran DA CHO KHONG PHAI la ma tran doi xung.');
        
    readln;
end.