program MaxHeapImplementation;
uses crt;
var
    heap: array[1..200] of integer;
    heapSize: integer;

procedure Swap(var a, b: integer);
var temp: integer;
begin
    temp := a; a := b; b := temp;
end;

procedure Push(val: integer);
var i: integer;
begin
    inc(heapSize);
    heap[heapSize] := val;
    i := heapSize;
    while (i > 1) and (heap[i] > heap[i div 2]) do
    begin
        Swap(heap[i], heap[i div 2]);
        i := i div 2;
    end;
end;

function Pop: integer;
var
    maxVal, i, largest, left, right: integer;
begin
    if heapSize = 0 then exit(-1);
    maxVal := heap[1];
    heap[1] := heap[heapSize];
    dec(heapSize);
    
    i := 1;
    while true do
    begin
        largest := i;
        left := 2 * i;
        right := 2 * i + 1;
        
        if (left <= heapSize) and (heap[left] > heap[largest]) then largest := left;
        if (right <= heapSize) and (heap[right] > heap[largest]) then largest := right;
        
        if largest = i then break;
        
        Swap(heap[i], heap[largest]);
        i := largest;
    end;
    Pop := maxVal;
end;

var choice, val: integer;
begin
    clrscr;
    heapSize := 0;
    repeat
        writeln('1. Them phan tu (Push)');
        writeln('2. Lay phan tu lon nhat (Pop)');
        writeln('3. Thoat');
        write('Chon thao tac: '); readln(choice);
        
        case choice of
            1: begin
                write('Nhap gia tri: '); readln(val);
                Push(val);
                writeln('Da them ', val, ' vao Heap.');
               end;
            2: begin
                val := Pop;
                if val <> -1 then writeln('Gia tri lon nhat: ', val)
                else writeln('Heap dang rong!');
               end;
        end;
        writeln('--------------------');
    until choice = 3;
end.