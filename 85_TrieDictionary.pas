program TrieDictionary;
uses crt;
type
    TriePtr = ^TrieNode;
    TrieNode = record
        children: array['a'..'z'] of TriePtr;
        isEndOfWord: boolean;
    end;

var
    root: TriePtr;
    i: char;
    choice: integer;
    st: string;

function CreateNode: TriePtr;
var
    p: TriePtr;
    ch: char;
begin
    new(p);
    p^.isEndOfWord := false;
    for ch := 'a' to 'z' do p^.children[ch] := nil;
    CreateNode := p;
end;

procedure Insert(root: TriePtr; key: string);
var
    p: TriePtr;
    i: integer;
begin
    p := root;
    for i := 1 to length(key) do
    begin
        if p^.children[key[i]] = nil then
            p^.children[key[i]] := CreateNode;
        p := p^.children[key[i]];
    end;
    p^.isEndOfWord := true;
end;

function Search(root: TriePtr; key: string): boolean;
var
    p: TriePtr;
    i: integer;
begin
    p := root;
    for i := 1 to length(key) do
    begin
        if p^.children[key[i]] = nil then exit(false);
        p := p^.children[key[i]];
    end;
    Search := (p <> nil) and (p^.isEndOfWord);
end;

begin
    clrscr;
    root := CreateNode;
    repeat
        writeln('1. Them tu vao Trie');
        writeln('2. Tim tu trong Trie');
        writeln('3. Thoat');
        write('Chon thao tac: '); readln(choice);
        case choice of
            1: begin
                write('Nhap tu (chu thuong a-z): '); readln(st);
                Insert(root, st);
                writeln('Da them tu "', st, '"!');
               end;
            2: begin
                write('Nhap tu can tim: '); readln(st);
                if Search(root, st) then
                    writeln('-> TIM THAY tu "', st, '" trong Trie!')
                else
                    writeln('-> KHONG TIM THAY!');
               end;
        end;
        writeln('---------------------------');
    until choice = 3;
end.