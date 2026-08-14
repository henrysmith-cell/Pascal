program FibonacciDeQuy;
uses crt;
var
    n, i: integer;

{ Ham de quy tinh so Fibonacci thu n }
function Fib(x: integer): longint;
begin
    if (x = 0) then
        Fib := 0
    else if (x = 1) then
        Fib := 1
    else
        Fib := Fib(x - 1) + Fib(x - 2);
end;

begin
    clrscr;
    write('Nhap n = ');
    readln(n);
    
    writeln('So Fibonacci thu ', n, ' la: ', Fib(n));
    
    write('Day ', n, ' so Fibonacci dau tien: ');
    for i := 0 to n do
        write(Fib(i), ' ');
        
    writeln;
    readln;
end.