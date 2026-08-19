program QuickSortDemo;
uses crt;
var
    A: array[1..100] of integer;
    n, i: integer;

procedure QuickSort(left, right: integer);
var
    i, j, pivot, temp: integer;
begin
    if left >= right then exit;
    
    pivot := A[(left + right) div 2];
    i := left;
    j := right;
    
    repeat
        while A[i] < pivot do inc(i);
        while A[j] > pivot do dec(j);
        
        if i <= j then
        begin
            temp := A[i]; A[i] := A[j]; A[j] := temp;
            inc(i); dec(j);
        end;
    until i > j;
    
    QuickSort(left, j);
    QuickSort(i, right);
end;

begin
    clrscr;
    write('Nhap N = '); readln(n);
    for i := 1 to n do
    begin
        write('A[', i, '] = '); readln(A[i]);
    end;
    
    QuickSort(1, n);
    
    writeln('Mang sau khi Quick Sort:');
    for i := 1 to n do write(A[i], ' ');
    writeln;
    readln;
end.