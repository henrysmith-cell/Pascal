program StringHashing;
uses crt;
const
    BASE = 31;
    MODUN = 1000000007;
var
    T, P: string;
    hashT, pPow: array[0..200] of int64;
    hashP: int64;
    n, m, i: integer;

function GetHash(l, r: integer): int64;
var res: int64;
begin
    res := (hashT[r] - (hashT[l - 1] * pPow[r - l + 1]) mod MODUN + MODUN) mod MODUN;
    GetHash := res;
end;

begin
    clrscr;
    write('Nhap xau van ban T: '); readln(T);
    write('Nhap xau mau P: '); readln(P);
    
    n := length(T); m := length(P);
    if m > n then begin writeln('Xau mau dai hon xau van ban!'); exit; end;
    
    pPow[0] := 1;
    for i := 1 to n do pPow[i] := (pPow[i - 1] * BASE) mod MODUN;
    
    hashT[0] := 0;
    for i := 1 to n do
        hashT[i] := (hashT[i - 1] * BASE + ord(T[i])) mod MODUN;
        
    hashP := 0;
    for i := 1 to m do
        hashP := (hashP * BASE + ord(P[i])) mod MODUN;
        
    writeln('CAC VI TRI XUAT HIEN CUA P TRONG T:');
    for i := 1 to n - m + 1 do
        if GetHash(i, i + m - 1) = hashP then
            writeln('Tim thấy tai chi so: ', i);
            
    readln;
end.