program TanSuatTrongFile;
uses crt;
var
    f: text;
    count: array[1..1000] of integer;
    so, i, maxFreq, valMax: integer;
begin
    clrscr;
    { Khoi tao màng dem tan suat }
    for i := 1 to 1000 do count[i] := 0;
    
    assign(f, 'DATA.INP');
    reset(f);
    
    while not eof(f) do
    begin
        read(f, so);
        if (so >= 1) and (so <= 1000) then
            inc(count[so]);
    end;
    close(f);
    
    { Tim gia tri co tan suat lon nhat }
    maxFreq := 0;
    valMax := 0;
    for i := 1 to 1000 do
    begin
        if count[i] > maxFreq then
        begin
            maxFreq := count[i];
            valMax := i;
        end;
    end;
    
    if maxFreq > 0 then
    begin
        writeln('Gia tri xuat hien nhieu nhat la: ', valMax);
        writeln('So lan xuat hien: ', maxFreq);
    end
    else
        writeln('File khong co du lieu hop le.');
        
    readln;
end.