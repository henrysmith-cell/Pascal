program ChuanHoaXau;
uses crt;
var
    S: string;
    i: integer;
begin
    clrscr;
    write('Nhap xau S: '); readln(S);
    
    { Xoa khoảng trang thua ở dau va cuoi }
    while (length(S) > 0) and (S[1] = ' ') do delete(S, 1, 1);
    while (length(S) > 0) and (S[length(S)] = ' ') do delete(S, length(S), 1);
    
    { Xoa khoảng trang thừa giua cac tu }
    i := 1;
    while i < length(S) do
    begin
        if (S[i] = ' ') and (S[i+1] = ' ') then
            delete(S, i, 1)
        else
            inc(i);
    end;
    
    { Chuan hoa hoa / thuong }
    if length(S) > 0 then
    begin
        for i := 1 to length(S) do S[i] := upcase(S[i]); { Tạm thoi viet hoa }
        
        S[1] := upcase(S[1]);
        for i := 2 to length(S) do
        begin
            if S[i-1] <> ' ' then
                { Chuyen thanh chu thuong neu khong phai dau tu }
                if (S[i] >= 'A') and (S[i] <= 'Z') then
                    S[i] := chr(ord(S[i]) + 32);
        end;
    end;
    
    writeln('Xau sau khi chuan hoa: "', S, '"');
    readln;
end.