program PhiHamEuler;
uses crt;
var
    n, temp, result, p: longint;
begin
    clrscr;
    write('Nhap N = '); readln(n);
    
    temp := n;
    result := n;
    p := 2;
    
    while p * p <= temp do
    begin
        if temp mod p = 0 then
        begin
            while temp mod p = 0 do temp := temp div p;
            result := result - (result div p);
        end;
        inc(p);
    end;
    
    if temp > 1 then
        result := result - (result div temp);
        
    writeln('Phi ham Euler Phi(', n, ') = ', result);
    readln;
end.