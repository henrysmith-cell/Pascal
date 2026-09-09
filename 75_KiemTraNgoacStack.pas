program KiemTraNgoacStack;
uses crt;
var
    stack: array[1..200] of char;
    top: integer;
    S: string;
    i: integer;
    isValid: boolean;

procedure Push(c: char);
begin
    inc(top);
    stack[top] := c;
end;

function Pop: char;
begin
    Pop := stack[top];
    dec(top);
end;

begin
    clrscr;
    write('Nhap xau ngoac S: '); readln(S);
    
    top := 0;
    isValid := true;
    
    for i := 1 to length(S) do
    begin
        if (S[i] = '(') or (S[i] = '[') or (S[i] = '{') then
            Push(S[i])
        else if (S[i] = ')') or (S[i] = ']') or (S[i] = '}') then
        begin
            if top = 0 then
            begin
                isValid := false;
                break;
            end;
            
            if ((S[i] = ')') and (stack[top] <> '(')) or
               ((S[i] = ']') and (stack[top] <> '[')) or
               ((S[i] = '}') and (stack[top] <> '{')) then
            begin
                isValid := false;
                break;
            end;
            Pop;
        end;
    end;
    
    if top <> 0 then isValid := false;
    
    if isValid then
        writeln('Xau ngoac HOP LE!')
    else
        writeln('Xau ngoac KHONG HOP LE!');
        
    readln;
end.