program CheckValidBST;
uses crt;
type
    NodePtr = ^Node;
    Node = record
        val: integer;
        left, right: NodePtr;
    end;

var
    root: NodePtr;

function CreateNode(v: integer): NodePtr;
var p: NodePtr;
begin
    new(p); p^.val := v; p^.left := nil; p^.right := nil;
    CreateNode := p;
end;

function IsBST(p: NodePtr; minVal, maxVal: longint): boolean;
begin
    if p = nil then exit(true);
    if (p^.val <= minVal) or (p^.val >= maxVal) then exit(false);
    
    IsBST := IsBST(p^.left, minVal, p^.val) and IsBST(p^.right, p^.val, maxVal);
end;

begin
    clrscr;
    { Dung cay mẫu: 10 / \ 5 15 }
    root := CreateNode(10);
    root^.left := CreateNode(5);
    root^.right := CreateNode(15);
    
    if IsBST(root, -2147483648, 2147483647) then
        writeln('-> Cay HOC LE la Cay tim kiem nhi phan (BST)!')
    else
        writeln('-> KHONG PHAI la Cay tim kiem nhi phan!');
        
    readln;
end.