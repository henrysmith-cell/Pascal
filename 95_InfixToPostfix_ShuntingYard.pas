program InfixToPostfix_ShuntingYard;
uses crt;
var
    stack: array[1..100] of char;
    top: integer;
    infix, postfix: string;
    i: integer;
    ch: char;

function Precedence(op: char): integer;
begin
    if (op = '*') or (op = '/') then exit(2);
    if (op = '+') or (op = '-') then exit(1);
    exit(0);
end;

procedure Push(c: char);
begin
    inc(top); stack[top] := c;
end;

function Pop: char;
begin
    Pop := stack[top]; dec(top);
end;

begin
    clrscr;
    write('Nhap bieu thuc Trung to (Infix): '); readln(infix);
    
    top := 0; postfix := '';
    for i := 1 to length(infix) do
    begin
        ch := infix[i];
        if (ch >= 'a') and (ch <= 'z') or (ch >= 'A') and (ch <= 'Z') or (ch >= '0') and (ch <= '9') then
            postfix := postfix + ch
        else if ch = '(' then
            Push(ch)
        else if ch = ')' then
        begin
            while (top > 0) and (stack[top] <> '(') do
                postfix := postfix + Pop;
            if top > 0 then Pop; { Xoa dau '(' }
        end
        else if (ch = '+') or (ch = '-') or (ch = '*') or (ch = '/') then
        begin
            while (top > 0) and (Precedence(stack[top]) >= Precedence(ch)) do
                postfix := postfix + Pop;
            Push(ch);
        end;
    end;
    
    while top > 0 do postfix := postfix + Pop;
    
    writeln('BIEU THUC HAU TO (POSTFIX): ', postfix);
    readln;
end.