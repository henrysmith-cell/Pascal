program SangEratosthenes;
uses crt;
var
    isPrime: array[1..100000] of boolean;
    n, i, j: longint;
begin
    clrscr;
    write('Nhap N = '); readln(n);
    
    { Khoi tao tat ca deu la so nguyen to }
    for i := 2 to n do isPrime[i] := true;
    
    { Sang Eratosthenes }
    for i := 2 to trunc(sqrt(n)) do
    begin
        if isPrime[i] then
        begin
            j := i * i;
            while j <= n do
            begin
                isPrime[j] := false; { Bo cac boi so cua i }
                j := j + i;
            end;
        end;
    end;
    
    writeln('Cac so nguyen to <= ', n, ' la:');
    for i := 2 to n do
        if isPrime[i] then write(i, ' ');
        
    writeln;
    readln;
end.