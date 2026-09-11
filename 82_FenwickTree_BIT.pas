program FenwickTree_BIT;
uses crt;
var
    bit: array[1..200] of longint;
    n, q, i, typeOp, idx, val, k: integer;

procedure Update(idx, val, n: integer);
begin
    while idx <= n do
    begin
        bit[idx] := bit[idx] + val;
        idx := idx + (idx and (-idx)); { Cong Bit thap nhat }
    end;
end;

function Query(idx: integer): longint;
var sum: longint;
begin
    sum := 0;
    while idx > 0 do
    begin
        sum := sum + bit[idx];
        idx := idx - (idx and (-idx)); { Tru Bit thap nhat }
    end;
    Query := sum;
end;

begin
    clrscr;
    write('Nhap N va so truy van Q: '); readln(n, q);
    for i := 1 to n do bit[i] := 0;
    
    writeln('Nhap cac thao tac: (1: Update idx val | 2: Query k)');
    for i := 1 to q do
    begin
        read(typeOp);
        if typeOp = 1 then
        begin
            readln(idx, val);
            Update(idx, val, n);
            writeln('Da cong ', val, ' vao vi tri ', idx);
        end
        else
        begin
            readln(k);
            writeln('Tong doan [1..', k, '] = ', Query(k));
        end;
    end;
    readln;
end.