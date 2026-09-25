program TreapDataStructure;
uses crt;
type
    TreapPtr = ^TreapNode;
    TreapNode = record
        key, priority: integer;
        left, right: TreapPtr;
    end;

var
    root: TreapPtr;
    i, n, val: integer;

function CreateNode(k: integer): TreapPtr;
var p: TreapPtr;
begin
    new(p);
    p^.key := k;
    p^.priority := random(1000); { Do uu tien ngau nhien }
    p^.left := nil; p^.right := nil;
    CreateNode := p;
end;

function RotateRight(y: TreapPtr): TreapPtr;
var x: TreapPtr;
begin
    x := y^.left;
    y^.left := x^.right;
    x^.right := y;
    RotateRight := x;
end;

function RotateLeft(x: TreapPtr): TreapPtr;
var y: TreapPtr;
begin
    y := x^.right;
    x^.right := y^.left;
    y^.left := x;
    RotateLeft := y;
end;

function Insert(root: TreapPtr; key: integer): TreapPtr;
begin
    if root = nil then exit(CreateNode(key));
    
    if key <= root^.key then
    begin
        root^.left := Insert(root^.left, key);
        if root^.left^.priority > root^.priority then
            root := RotateRight(root);
    end
    else
    begin
        root^.right := Insert(root^.right, key);
        if root^.right^.priority > root^.priority then
            root := RotateLeft(root);
    end;
    Insert := root;
end;

procedure InOrder(root: TreapPtr);
begin
    if root <> nil then
    begin
        InOrder(root^.left);
        writeln('Key: ', root^.key:4, ' | Priority: ', root^.priority:5);
        InOrder(root^.right);
    end;
end;

begin
    clrscr;
    randomize;
    root := nil;
    write('Nhap so phan tu can chen N = '); readln(n);
    writeln('Nhap ', n, ' gia tri:');
    for i := 1 to n do
    begin
        read(val);
        root := Insert(root, val);
    end;
    
    writeln('DUYET TREAP THEO THU TU TRUNG VI (IN-ORDER):');
    InOrder(root);
    readln; readln;
end.