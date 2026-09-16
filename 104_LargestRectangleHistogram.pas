program LargestRectangleHistogram;
uses crt;
var
    H, stack: array[0..200] of longint;
    top, n, i: integer;
    maxArea, currentArea, tp: longint;

begin
    clrscr;
    write('Nhap so cot N = '); readln(n);
    writeln('Nhap chieu cao cac cot H:');
    for i := 1 to n do read(H[i]);
    H[n + 1] := 0; { Cot ao chieu cao 0 de xua toan bo stack cuoi cung }
    
    top := 0; maxArea := 0;
    i := 1;
    while i <= n + 1 do
    begin
        if (top = 0) or (H[stack[top]] <= H[i]) then
        begin
            inc(top); stack[top] := i;
            inc(i);
        end
        else
        begin
            tp := stack[top]; dec(top);
            if top = 0 then
                currentArea := H[tp] * (i - 1)
            else
                currentArea := H[tp] * (i - stack[top] - 1);
                
            if currentArea > maxArea then maxArea := currentArea;
        end;
    end;
    
    writeln('DIEN TICH HINH CHU NHAT LON NHAT = ', maxArea);
    readln; readln;
end.