program BinarySearchTree;
uses crt;
type
    NodePtr = ^TreeNode;
    TreeNode = record
        data: integer;
        left, right: NodePtr;
    end;

var
    root: NodePtr;
    n, i, val: integer;

procedure Insert(var root: NodePtr; val: integer);
begin
    if root = nil then
    begin
        new(root);
        root^.data := val;
        root^.left := nil;
        root^.right := nil;
    end
    else if val < root^.data then
        Insert(root^.left, val)
    else if val > root^.data then
        Insert(root^.right, val);
end;

procedure InOrder(root: NodePtr);
begin
    if root <> nil then
    begin
        InOrder(root^.left);
        write(root^.data, ' ');
        InOrder(root^.right);
    end;
end;

begin
    clrscr;
    root := nil;
    write('Nhap so phan tu N = '); readln(n);
    
    writeln('Nhap ', n, ' so nguyen:');
    for i := 1 to n do
    begin
        read(val);
        Insert(root, val);
    end;
    
    writeln('DUYET CAY THEO THU TU GIUA (IN-ORDER):');
    InOrder(root);
    writeln;
    
    readln; readln;
end.