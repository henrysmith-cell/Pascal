program NenXauRLE;
uses crt;
var
    S, res: string;
    i, count: integer;
    countStr: string;
begin
    clrscr;
    write('Nhap xau S: '); readln(S);
    
    if length(S) = 0 then exit;
    
    res := '';
    count := 1;
    
    for i := 1 to length(S) do
    begin
        if (i < length(S)) and (S[i] = S[i + 1]) then
            inc(count)
        else
        begin
            str(count, countStr);
            res := res + S[i] + countStr;
            count := 1;
        end;
    end;
    
    writeln('Xau sau khi nen: ', res);
    readln;
end.