program KadaneAlgorithm;
uses crt;
var
    A: array[1..100] of integer;
    n, i, maxSoFar, maxEndingHere: integer;

begin
    clrscr;
    write('Nhap N = '); readln(n);
    for i := 1 to n do
    begin
        write('A[', i, '] = ');
        readln(A[i]);
    end;
    
    maxSoFar := A[1];
    maxEndingHere := A[1];
    
    for i := 2 to n do
    begin
        if maxEndingHere + A[i] > A[i] then
            maxEndingHere := maxEndingHere + A[i]
        else
            maxEndingHere := A[i];
            
        if maxEndingHere > maxSoFar then
            maxSoFar := maxEndingHere;
    end;
    
    writeln('Tong day con lien tiep lon nhat: ', maxSoFar);
    readln;
end.