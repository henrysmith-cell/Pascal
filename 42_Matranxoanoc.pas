program MaTranXoanOc;
uses crt;
var
    A: array[1..20, 1..20] of integer;
    n, val, top, bottom, left, right, i: integer;
begin
    clrscr;
    write('Nhap cap ma tran N = '); readln(n);
    
    val := 1;
    top := 1; bottom := n;
    left := 1; right := n;
    
    while (top <= bottom) and (left <= right) do
    begin
        { Hang tren: Tu trái sang phai }
        for i := left to right do
        begin
            A[top, i] := val; inc(val);
        end;
        inc(top);
        
        { Cot phai: Tu tren xuong duoi }
        for i := top to bottom do
        begin
            A[i, right] := val; inc(val);
        end;
        dec(right);
        
        { Hang duoi: Tu phai sang trái }
        if top <= bottom then
        begin
            for i := right downto left do
            begin
                A[bottom, i] := val; inc(val);
            end;
            dec(bottom);
        end;
        
        { Cot trái: Tu duoi len tren }
        if left <= right then
        begin
            for i := bottom downto top do
            begin
                A[i, left] := val; inc(val);
            end;
            inc(left);
        end;
    end;
    
    writeln('MA TRAN XOAN OC ', n, 'x', n, ':');
    for i := 1 to n do
    begin
        for var j := 1 to n do write(A[i, j]:4);
        writeln;
    end;
    
    readln;
end.