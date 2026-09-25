program MatrixExponentiation_Fibonacci;
uses crt;
type
    Matrix = array[1..2, 1..2] of int64;
const
    MODUN = 1000000007;
var
    n: longint;
    base, res: Matrix;

function Multiply(A, B: Matrix): Matrix;
var
    C: Matrix;
    i, j, k: integer;
begin
    for i := 1 to 2 do
        for j := 1 to 2 do
        begin
            C[i, j] := 0;
            for k := 1 to 2 do
                C[i, j] := (C[i, j] + A[i, k] * B[k, j]) mod MODUN;
        end;
    Multiply := C;
end;

function PowerMatrix(A: Matrix; p: longint): Matrix;
var
    resMatrix: Matrix;
begin
    resMatrix[1, 1] := 1; resMatrix[1, 2] := 0;
    resMatrix[2, 1] := 0; resMatrix[2, 2] := 1; { Ma tran don vi }
    
    while p > 0 do
    begin
        if p mod 2 = 1 then resMatrix := Multiply(resMatrix, A);
        A := Multiply(A, A);
        p := p div 2;
    end;
    PowerMatrix := resMatrix;
end;

begin
    clrscr;
    write('Nhap N = '); readln(n);
    
    if n = 0 then writeln('F(0) = 0')
    else
    begin
        base[1, 1] := 1; base[1, 2] := 1;
        base[2, 1] := 1; base[2, 2] := 0;
        
        res := PowerMatrix(base, n - 1);
        writeln('So Fibonacci F(', n, ') mod 10^9+7 = ', res[1, 1]);
    end;
    
    readln;
end.