program SuffixArray_Basic;
uses crt;
type
    Suffix = record
        index: integer;
        suff: string;
    end;
var
    SA: array[1..100] of Suffix;
    S: string;
    n, i, j: integer;
    temp: Suffix;

begin
    clrscr;
    write('Nhap xau S: '); readln(S);
    n := length(S);
    
    for i := 1 to n do
    begin
        SA[i].index := i;
        SA[i].suff := copy(S, i, n - i + 1);
    end;
    
    { Sap xep cac xau hau to theo thu tu tu dien }
    for i := 1 to n - 1 do
        for j := i + 1 to n do
            if SA[i].suff > SA[j].suff then
            begin
                temp := SA[i]; SA[i] := SA[j]; SA[j] := temp;
            end;
            
    writeln('MANG HAU TO (SUFFIX ARRAY):');
    writeln('Chi so':8, ' | ', 'Xau hau to');
    writeln('---------------------------');
    for i := 1 to n do
        writeln(SA[i].index:8, ' | ', SA[i].suff);
        
    readln;
end.