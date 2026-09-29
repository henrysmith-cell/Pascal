program LCS_3Strings;
uses crt;
var
    A, B, C: string;
    dp: array[0..30, 0..30, 0..30] of integer;
    n, m, p, i, j, k: integer;

function Max3(a, b, c: integer): integer;
var m: integer;
begin
    m := a;
    if b > m then m := b;
    if c > m then m := c;
    Max3 := m;
end;

begin
    clrscr;
    write('Nhap xau A: '); readln(A);
    write('Nhap xau B: '); readln(B);
    write('Nhap xau C: '); readln(C);
    
    n := length(A); m := length(B); p := length(C);
    
    for i := 0 to n do
        for j := 0 to m do
            for k := 0 to p do
                dp[i, j, k] := 0;
                
    for i := 1 to n do
        for j := 1 to m do
            for k := 1 to p do
            begin
                if (A[i] = B[j]) and (B[j] = C[k]) then
                    dp[i, j, k] := dp[i - 1, j - 1, k - 1] + 1
                else
                    dp[i, j, k] := Max3(dp[i - 1, j, k], dp[i, j - 1, k], dp[i, j, k - 1]);
            end;
            
    writeln('DO DAI CHUOI CON CHUNG DAI NHAT CUA 3 XAU = ', dp[n, m, p]);
    readln;
end.