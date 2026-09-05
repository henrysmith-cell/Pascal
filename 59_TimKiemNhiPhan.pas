program TimKiemNhiPhan;
uses crt;
var
    A: array[1..100] of integer;
    n, x, i, left, right, mid, pos: integer;
begin
    clrscr;
    write('Nhap N = '); readln(n);
    writeln('Nhap mangan da sap xep tang dan:');
    for i := 1 to n do read(A[i]);
    
    write('Nhap gia tri can tim X = '); readln(x);
    
    left := 1; right := n; pos := -1;
    while left <= right do
    begin
        mid := (left + right) div 2;
        if A[mid] = x then
        begin
            pos := mid;
            break;
        end
        else if A[mid] < x then
            left := mid + 1
        else
            right := mid - 1;
    end;
    
    if pos <> -1 then
        writeln('Tim thay ', x, ' tai vi tri chi so: ', pos)
    else
        writeln('Khong tim thay ', x, ' trong mang!');
        
    readln;
end.