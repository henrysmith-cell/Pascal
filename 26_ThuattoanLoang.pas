program MeCungBFS;
uses crt;
var
    A: array[1..50, 1..50] of integer;
    visited: array[1..50, 1..50] of boolean;
    QX, QY: array[1..2500] of integer;
    m, n, i, j, front, rear: integer;
    dx: array[1..4] of integer = (-1, 1, 0, 0);
    dy: array[1..4] of integer = (0, 0, -1, 1);
    found: boolean;

procedure Push(x, y: integer);
begin
    inc(rear);
    QX[rear] := x;
    QY[rear] := y;
    visited[x, y] := true;
end;

begin
    clrscr;
    write('Nhap so hang M va so cot N: '); readln(m, n);
    
    writeln('Nhap ma tran me cung (0: đi duoc, 1: vat can):');
    for i := 1 to m do
        for j := 1 to n do
        begin
            read(A[i, j]);
            visited[i, j] := false;
        end;
        
    front := 1; rear := 0;
    found := false;
    
    if A[1, 1] = 0 then Push(1, 1);
    
    while front <= rear do
    begin
        i := QX[front];
        j := QY[front];
        inc(front);
        
        if (i = m) and (j = n) then
        begin
            found := true;
            break;
        end;
        
        { Duyet 4 huong }
        for var k := 1 to 4 do
        begin
            var u := i + dx[k];
            var v := j + dy[k];
            if (u >= 1) and (u <= m) and (v >= 1) and (v <= n) then
                if (A[u, v] = 0) and (not visited[u, v]) then
                    Push(u, v);
        end;
    end;
    
    if found then
        writeln('CO duong di tu (1,1) den (', m, ',', n, ')!')
    else
        writeln('KHONG CO duong di!');
        
    readln;
end.