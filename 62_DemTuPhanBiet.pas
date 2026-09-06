program DemTuPhanBiet;
uses crt;
var
    S, word: string;
    words: array[1..200] of string;
    i, wordCount, uniqueCount, j: integer;
    isExist: boolean;

function ToUpper(st: string): string;
var
    k: integer;
begin
    for k := 1 to length(st) do st[k] := upcase(st[k]);
    ToUpper := st;
end;

begin
    clrscr;
    write('Nhap doan van ban S: '); readln(S);
    S := S + ' '; { Them khoang trang cuoi de xu ly tu cuoi }
    
    wordCount := 0;
    word := '';
    for i := 1 to length(S) do
    begin
        if S[i] <> ' ' then
            word := word + S[i]
        else if length(word) > 0 then
        begin
            inc(wordCount);
            words[wordCount] := ToUpper(word);
            word := '';
        end;
    end;
    
    uniqueCount := 0;
    for i := 1 to wordCount do
    begin
        isExist := false;
        for j := 1 to i - 1 do
            if words[i] = words[j] then
            begin
                isExist := true;
                break;
            end;
        if not isExist then inc(uniqueCount);
    end;
    
    writeln('Tong so tu: ', wordCount);
    writeln('So tu PHAN BIET: ', uniqueCount);
    readln;
end.