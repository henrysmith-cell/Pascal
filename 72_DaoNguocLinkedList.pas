program DaoNguocLinkedList;
uses crt;
type
    NodePtr = ^Node;
    Node = record
        data: integer;
        next: NodePtr;
    end;

var
    head, p, prev, nextNode: NodePtr;
    n, i, val: integer;

begin
    clrscr;
    head := nil;
    write('Nhap so phan tu N = '); readln(n);
    
    for i := 1 to n do
    begin
        write('Nhap phan tu thứ ', i, ': '); readln(val);
        new(p);
        p^.data := val;
        p^.next := head;
        head := p;
    end;
    
    { Dao nguoc danh sach bang 3 con tro }
    prev := nil;
    p := head;
    while p <> nil do
    begin
        nextNode := p^.next;
        p^.next := prev;
        prev := p;
        p := nextNode;
    end;
    head := prev;
    
    writeln('DANH SACH SAU KHI DAO NGUOC:');
    p := head;
    while p <> nil do
    begin
        write(p^.data, ' -> ');
        p := p^.next;
    end;
    writeln('NIL');
    
    readln;
end.