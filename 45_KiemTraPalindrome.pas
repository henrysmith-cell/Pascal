program KiemTraPalindrome;
uses crt;
var
    S, temp: string;
    i: integer;
    isPalin: boolean;
begin
    clrscr;
    write('Nhap xau S: '); readln(S);
    
    { Chuyen xau S thanh chu hoa de so sanh }
    temp := S;
    for i := 1 to length(temp) do
        temp[i] := upcase(temp[i]);
        
    isPalin := true;
    for i := 1 to length(temp) div 2 do
    begin
        if temp[i] <> temp[length(temp) - i + 1] then
        begin
            isPalin := false;
            break;
        end;
    end;
    
    if isPalin then
        writeln('Xau "', S, '" LA xau doi xung!')
    else
        writeln('Xau "', S, '" KHONG PHAI la xau doi xung!');
        
    readln;
end.