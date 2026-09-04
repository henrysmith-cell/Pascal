program TichHaiMaTran;
uses crt;
var
    A: array[1..10, 1..10] of integer;
    B: array[1..10, 1..10] of integer;
    C: array[1..10, 1..10] of longint;
    m, n, p, i, j, k: integer;
begin
    clrscr;
    write('Nhap m, n (kich thuoc A: m x n): '); readln(m, n);
    write('Nhap p (kich thuoc B: n x p): '); readln(p);
    
    writeln('Nhap ma tran A:');
    for i := 1 to m do
        for j := 1 to n do read(A[i, j]);
        
    writeln('Nhap ma tran B:');
    for i := 1 to n do
        for j := 1 to p do read(B[i, j]);
        
    { Nhan hai ma tran }
    for i := 1 to m do
        for j := 1 to p do
        begin
            C[i, j] := 0;
            for k := 1 to n do
                C[i, j] := C[i, j] + longint(A[i, k]) * B[k, j];
        end;
        
    writeln('MA TRAN TICH C (', m, 'x', p, '):');
    for i := 1 to m do
    begin
        for j := 1 to p do
            write(C[i, j]:8);
        writeln;
    end;
    
    readln;
end.