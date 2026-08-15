program ChuanHoaHoTen;
uses crt;
var
    S: string;
    i: integer;
begin
    clrscr;
    write('Nhap ho ten chua chuan hoa: ');
    readln(S);
    
    { Step 1: Xoa khoảng trang dau va cuoi }
    while (length(S) > 0) and (S[1] = ' ') do delete(S, 1, 1);
    while (length(S) > 0) and (S[length(S)] = ' ') do delete(S, length(S), 1);
    
    { Step 2: Xoa khoảng trang giua cac tu }
    i := 1;
    while i < length(S) do
    begin
        if (S[i] = ' ') and (S[i+1] = ' ') then
            delete(S, i, 1)
        else
            i := i + 1;
    end;
    
    { Step 3: Chuyen toan bo xau ve chữ thuong }
    for i := 1 to length(S) do
        S[i] := upcase(S[i]); { Upcase chi viet hoa, ta xu ly thủ cong neu can }
    for i := 1 to length(S) do
        if S[i] in ['A'..'Z'] then
            S[i] := chr(ord(S[i]) + 32);
            
    { Step 4: Viet hoa ky tu dau moi tu }
    if length(S) > 0 then
    begin
        S[1] := upcase(S[1]);
        for i := 1 to length(S) - 1 do
        begin
            if S[i] = ' ' then
                S[i+1] := upcase(S[i+1]);
        end;
    end;
    
    writeln('Ho ten sau khi chuan hoa: "', S, '"');
    readln;
end.