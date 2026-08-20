program KiemTraNgoac;
uses crt;
var
    S: string;
    i, top: integer;
    isValid: boolean;
begin
    clrscr;
    write('Nhap xau ngoac: '); readln(S);
    
    top := 0; { Chi so Stack }
    isValid := true;
    
    for i := 1 to length(S) do
    begin
        if S[i] = '(' then
            inc(top) { Push vao stack }
        else if S[i] = ')' then
        begin
            if top > 0 then
                dec(top) { Pop khoi stack }
            else
            begin
                isValid := false;
                break;
            end;
        end;
    end;
    
    if top <> 0 then isValid := false;
    
    if isValid then
        writeln('Xau ngoac HOP LE!')
    else
        writeln('Xau ngoac KHONG HOP LE!');
        
    readln;
end.