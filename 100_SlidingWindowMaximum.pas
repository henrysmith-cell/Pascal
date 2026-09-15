program SlidingWindowMaximum;
uses crt;
var
    A, deque: array[1..200] of integer;
    head, tail, n, k, i: integer;

begin
    clrscr;
    write('Nhap N va kich thuoc cua so K: '); readln(n, k);
    writeln('Nhap mang A:');
    for i := 1 to n do read(A[i]);
    
    head := 1; tail := 0;
    writeln('GIA TRI MAX TREN MOI CUA SO TRUOT K:');
    
    for i := 1 to n do
    begin
        { Loai bo cac phan tu nam ngoai cua so }
        while (head <= tail) and (deque[head] <= i - k) do inc(head);
        
        { Loai bo cac phan tu nho hon A[i] tu phia sau deque }
        while (head <= tail) and (A[deque[tail]] <= A[i]) do dec(tail);
        
        inc(tail); deque[tail] := i;
        
        { In ket qua khi cua so da du K phan tu }
        if i >= k then write(A[deque[head]], ' ');
    end;
    
    writeln;
    readln; readln;
end.