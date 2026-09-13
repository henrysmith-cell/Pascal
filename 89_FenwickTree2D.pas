program FenwickTree2D;
uses crt;
var
    bit: array[1..100, 1..100] of longint;
    m, n, q, i, typeOp, x, y, val: integer;

procedure Update2D(x, y, val, m, n: integer);
var origY: integer;
begin
    origY := y;
    while x <= m do
    begin
        y := origY;
        while y <= n do
        begin
            bit[x, y] := bit[x, y] + val;
            y := y + (y and (-y));
        end;
        x := x + (x and (-x));
    end;
end;

function Query2D(x, y: integer): longint;
var
    sum: longint;
    origY: integer;
begin
    sum := 0; origY := y;
    while x > 0 do
    begin
        y := origY;
        while y > 0 do
        begin
            sum := sum + bit[x, y];
            y := y - (y and (-y));
        end;
        x := x - (x and (-x));
    end;
    Query2D := sum;
end;

begin
    clrscr;
    write('Nhap kich thuoc ma tran M N va so truy van Q: '); readln(m, n, q);
    for x := 1 to m do for y := 1 to n do bit[x, y] := 0;
    
    writeln('Thao tac (1: Update x y val | 2: Query x y):');
    for i := 1 to q do
    begin
        read(typeOp);
        if typeOp = 1 then
        begin
            readln(x, y, val);
            Update2D(x, y, val, m, n);
            writeln('Da cong ', val, ' vao o (', x, ', ', y, ')');
        end
        else
        begin
            readln(x, y);
            writeln('Tong hinh chu nhat (1,1) -> (', x, ',', y, ') = ', Query2D(x, y));
        end;
    end;
    readln;
end.