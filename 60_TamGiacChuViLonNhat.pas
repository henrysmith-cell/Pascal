program TamGiacChuViLonNhat;
uses crt;
var
    A: array[1..100] of integer;
    n, i, j, temp, maxPerimeter: integer;
begin
    clrscr;
    write('Nhap so doan thang N (N >= 3): '); readln(n);
    for i := 1 to n do
    begin
        write('A[', i, '] = '); readln(A[i]);
    end;
    
    { Sap xep mang giam dan }
    for i := 1 to n - 1 do
        for j := i + 1 to n do
            if A[i] < A[j] then
            begin
                temp := A[i]; A[i] := A[j]; A[j] := temp;
            end;
            
    maxPerimeter := -1;
    { Kiem tra dieu kien tam giac voi 3 canh lien tiep }
    for i := 1 to n - 2 do
    begin
        if A[i] < A[i + 1] + A[i + 2] then
        begin
            maxPerimeter := A[i] + A[i + 1] + A[i + 2];
            writeln('Ba canh tao thanh tam giac lon nhat: ', A[i], ', ', A[i+1], ', ', A[i+2]);
            break;
        end;
    end;
    
    if maxPerimeter <> -1 then
        writeln('Chu vi lon nhat la: ', maxPerimeter)
    else
        writeln('Khong the tao thanh tam giac tu cac doan thang tren!');
        
    readln;
end.