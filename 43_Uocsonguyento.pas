program UocNguyenToLonNhat;
uses crt;
var
    n, temp, maxPrime, d: int64;
begin
    clrscr;
    write('Nhap N = '); readln(n);
    
    temp := n;
    maxPrime := -1;
    
    { Xuly cac thua so 2 }
    while temp mod 2 = 0 do
    begin
        maxPrime := 2;
        temp := temp div 2;
    end;
    
    { Xuly cac thua so le tu 3 }
    d := 3;
    while d * d <= temp do
    begin
        while temp mod d = 0 do
        begin
            maxPrime := d;
            temp := temp div d;
        end;
        d := d + 2;
    end;
    
    if temp > 1 then maxPrime := temp;
    
    writeln('Uoc so nguyen to lon nhat cua ', n, ' la: ', maxPrime);
    readln;
end.