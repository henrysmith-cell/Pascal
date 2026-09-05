program QuanLyHocSinh;
uses crt;
type
    HocSinh = record
        HoTen: string[30];
        DiemToan, DiemTin, DiemTB: real;
    end;
var
    ds: array[1..100] of HocSinh;
    n, i, j: integer;
    temp: HocSinh;
begin
    clrscr;
    write('Nhap so luong hoc sinh N = '); readln(n);
    
    for i := 1 to n do
    begin
        writeln('--- Hoc sinh thứ ', i, ' ---');
        write('Ho ten: '); readln(ds[i].HoTen);
        write('Diem Toan: '); readln(ds[i].DiemToan);
        write('Diem Tin: '); readln(ds[i].DiemTin);
        ds[i].DiemTB := (ds[i].DiemToan + ds[i].DiemTin) / 2;
    end;
    
    { Sap xep giam dan theo DiemTB }
    for i := 1 to n - 1 do
        for j := i + 1 to n do
            if ds[i].DiemTB < ds[j].DiemTB then
            begin
                temp := ds[i];
                ds[i] := ds[j];
                ds[j] := temp;
            end;
            
    writeln;
    writeln('DANH SACH HOC SINH SAP XEP THEO DIEM TRUNG BINH:');
    writeln('Ho Ten':30, 'Diem Toan':12, 'Diem Tin':12, 'Diem TB':12);
    for i := 1 to n do
        writeln(ds[i].HoTen:30, ds[i].DiemToan:12:1, ds[i].DiemTin:12:1, ds[i].DiemTB:12:2);
        
    readln;
end.