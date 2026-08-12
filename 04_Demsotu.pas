program DemSoTu;
uses crt, string;
var
    S: string;
    i, dem: integer;
begin
    clrscr;
    write('Nhap xau ky tu S: ');
    readln(S);
    
    { Xoa khoảng trang thua o dau va cuoi xau }
    while (length(S) > 0) and (S[1] = ' ') do
        delete(S, 1, 1);
    while (length(S) > 0) and (S[length(S)] = ' ') do
        delete(S, length(S), 1);
        
    if length(S) = 0 then
        dem := 0
    else
    begin
        dem := 1;
        for i := 1 to length(S) - 1 do
        begin
            { Neu gap khoảng trang va sau no khong phai khoảng trang thi tang dem }
            if (S[i] = ' ') and (S[i+1] <> ' ') then
                dem := dem + 1;
        end;
    end;
    
    writeln('So tu trong xau la: ', dem);
    readln;
end.