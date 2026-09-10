program TSP_Bitmask;
uses crt;
const
    INF = 10000000;
var
    cost: array[0..15, 0..15] of integer;
    memo: array[0..15, 0..65535] of longint;
    n, i, j, fullMask: integer;

function Min(a, b: longint): longint;
begin
    if a < b then Min := a else Min := b;
end;

function TSP(u, mask: integer): longint;
var
    v: integer;
    ans: longint;
begin
    if mask = fullMask then exit(cost[u, 0]); { Quay ve dinh 0 }
    if memo[u, mask] <> -1 then exit(memo[u, mask]);
    
    ans := INF;
    for v := 0 to n - 1 do
    begin
        if (mask and (1 shl v)) = 0 then
            ans := Min(ans, cost[u, v] + TSP(v, mask or (1 shl v)));
    end;
    
    memo[u, mask] := ans;
    TSP := ans;
end;

begin
    clrscr;
    write('Nhap so thanh pho N (N <= 15): '); readln(n);
    
    writeln('Nhap ma tran chi phi (NxN):');
    for i := 0 to n - 1 do
        for j := 0 to n - 1 do read(cost[i, j]);
        
    fullMask := (1 shl n) - 1;
    for i := 0 to n do
        for j := 0 to fullMask do memo[i, j] := -1;
        
    writeln('Chi phi du lich nho nhat: ', TSP(0, 1));
    readln; readln;
end.