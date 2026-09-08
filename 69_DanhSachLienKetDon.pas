program DanhSachLienKetDon;
uses crt;
type
    NodePtr = ^Node;
    Node = record
        data: integer;
        next: NodePtr;
    end;

var
    head, tail, p: NodePtr;
    val: integer;

begin
    clrscr;
    head := nil;
    tail := nil;
    
    writeln('Nhap cac so nguyen (Nhap 0 de ket thuc):');
    repeat
        read(val);
        if val <> 0 then
        begin
            new(p);
            p^.data := val;
            p^.next := nil;
            
            if head = nil then
            begin
                head := p;
                tail := p;
            end
            else
            begin
                tail^.next := p;
                tail := p;
            end;
        end;
    until val = 0;
    
    writeln('DANH SACH DA NHAP:');
    p := head;
    while p <> nil do
    begin
        write(p^.data, ' -> ');
        p := p^.next;
    end;
    writeln('NIL');
    
    readln; readln;
end.