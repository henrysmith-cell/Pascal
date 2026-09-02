program DoiTienDP;
uses crt;
const
    INF = 1000000;
var
    coins: array[1..20] of integer;
    DP: array[0..1000] of integer;
    n, S, i, j: integer;

function Min(a, b: integer): integer;
begin
    if a < b then Min := a else Min := b;
end;

begin
    clrscr;
    write('Nhap so loai men gia N = '); readln(n);
    write('Nhap cac men gia: ');
    for i := 1 to n do read(coins[i]);
    
    write('Nhap so tien can doi S = '); readln(S);
    
    { Khoi tao mang Quy hoach dong }
    DP[0] := 0;
    for i := 1 to S do DP[i] := INF;
    
    for i := 1 to S do
        for j := 1 to n do
            if coins[j] <= i then
                DP[i] := Min(DP[i], DP[i - coins[j]] + 1);
                
    if DP[S] >= INF then
        writeln('Khong the doi duoc so tien ', S, ' voi cac men gia tren!')
    else
        writeln('So to tien it nhat can dung la: ', DP[S]);
        
    readln;
end.