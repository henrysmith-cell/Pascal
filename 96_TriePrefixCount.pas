program TriePrefixCount;
uses crt;
type
    TriePtr = ^TrieNode;
    TrieNode = record
        passCount: integer;
        children: array['a'..'z'] of TriePtr;
    end;

var
    root: TriePtr;
    n, q, i: integer;
    word, pref: string;

function CreateNode: TriePtr;
var
    p: TriePtr;
    ch: char;
begin
    new(p);
    p^.passCount := 0;
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
        inc(p^.passCount);
    end;
end;

function CountPrefix(root: TriePtr; pref: string): integer;
var
    p: TriePtr;
    i: integer;
begin
    p := root;
    for i := 1 to length(pref) do
    begin
        if p^.children[pref[i]] = nil then exit(0);
        p := p^.children[pref[i]];
    end;
    CountPrefix := p^.passCount;
end;

begin
    clrscr;
    root := CreateNode;
    write('Nhap so tu ban dau N = '); readln(n);
    writeln('Nhap các tu (chu thuong a-z):');
    for i := 1 to n do
    begin
        readln(word);
        Insert(root, word);
    end;
    
    write('Nhap so truy van dem tien to Q = '); readln(q);
    for i := 1 to q do
    begin
        write('Nhap tien to: '); readln(pref);
        writeln('-> So tu co tien to "', pref, '" = ', CountPrefix(root, pref));
    end;
    readln;
end.