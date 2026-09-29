program Fenwick_RangeUpdatePointQuery;
uses crt;
var
    bit: array[1..200] of longint;
    n, q, i, typeOp, l, r, p, val: integer;

procedure Update(idx, val, n: integer);
begin
    while idx <= n do
    begin
        bit[idx] := bit[idx] + val;
        idx := idx + (idx and (-idx));
    end;
end;

procedure RangeUpdate(l, r, val, n: integer);
begin
    Update(l, val, n);
    Update(r + 1, -val, n);
end;

function PointQuery(idx: integer): longint;
var sum: longint;
begin
    sum := 0;
    while idx > 0 do
    begin
        sum := sum + bit[idx];
        idx := idx - (idx and (-idx));
    end;
    PointQuery := sum;
end;

begin
    clrscr;
    write('Nhap N va so truy van Q: '); readln(n, q);
    for i := 1 to n do bit[i] := 0;
    
    writeln('Thao tac (1: Update doan L R val | 2: Query gia tri tai P):');
    for i := 1 to q do
    begin
        read(typeOp);
        if typeOp = 1 then
        begin
            readln(l, r, val);
            RangeUpdate(l, r, val, n);
            writeln('Da cong ', val, ' vao doan [', l, '..', r, ']');
        end
        else
        begin
            readln(p);
            writeln('Gia tri tai vi tri ', p, ' = ', PointQuery(p));
        end;
    end;
    readln;
end.