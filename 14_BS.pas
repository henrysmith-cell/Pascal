program TimKiemNhiPhan;
uses crt;
var
    A: array[1..100] of integer;
    n, i, x, left, right, mid, viTri: integer;
begin
    clrscr;
    write('Nhap so phan tu N = ');
    readln(n);
    
    writeln('Nhap mảng A tang dan:');
    for i := 1 to n do
    begin
        write('A[', i, '] = ');
        readln(A[i]);
    end;
    
    write('Nhap so X can tim = ');
    readln(x);
    
    { Thuat toan Binary Search }
    left := 1;
    right := n;
    viTri := -1;
    
    while left <= right do
    begin
        mid := (left + right) div 2;
        if A[mid] = x then
        begin
            viTri := mid;
            break;
        end;
        
        if A[mid] < x then
            left := mid + 1
        else
            right := mid - 1;
    end;
    
    if viTri <> -1 then
        writeln('Tim thay ', x, ' tai vi tri: ', viTri)
    else
        writeln('Khong tim thay ', x, ' trong mang.');
        
    readln;
end.