program DocGhiFile;
uses crt;
var
    fIn, fOut: text;
    so, tong: longint;
begin
    clrscr;
    
    { Gan file va mo file de doc }
    assign(fIn, 'NUMBERS.INP');
    reset(fIn);
    
    { Gan file va mo file de ghi }
    assign(fOut, 'RESULT.OUT');
    rewrite(fOut);
    
    tong := 0;
    { Doc cho den khi het file }
    while not eof(fIn) do
    begin
        read(fIn, so);
        tong := tong + so;
    end;
    
    { Ghi ket qua vao file va in ra màn hinh }
    writeln(fOut, 'Tong cac so trong file la: ', tong);
    writeln('Da tinh xong! Ket qua duoc ghi vao RESULT.OUT');
    writeln('Tong = ', tong);
    
    { Dong cac file }
    close(fIn);
    close(fOut);
    
    readln;
end.