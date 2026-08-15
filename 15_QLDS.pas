program QuanLyHocSinh;
uses crt;

type
    HocSinh = record
        hoTen: string[30];
        dtb: real;
    end;

var
    ds: array[1..50] of HocSinh;
    n, i: integer;
    tongDTB, dtbChung: real;

begin
    clrscr;
    write('Nhap so luong hoc sinh N = ');
    readln(n);
    
    tongDTB := 0;
    for i := 1 to n do
    begin
        writeln('--- Nhap thong tin HS thu ', i, ' ---');
        write('Ho ten: '); readln(ds[i].hoTen);
        write('Diem trung binh: '); readln(ds[i].dtb);
        tongDTB := tongDTB + ds[i].dtb;
    end;
    
    dtbChung := tongDTB / n;
    
    writeln;
    writeln('===> Diem trung binh chung cua lop: ', dtbChung:0:2);
    writeln('===> Danh sach Hoc sinh Gioi (DTB >= 8.0):');
    
    for i := 1 to n do
    begin
        if ds[i].dtb >= 8.0 then
            writeln('- ', ds[i].hoTen, ' | DTB: ', ds[i].dtb:0:2);
    end;
    
    readln;
end.