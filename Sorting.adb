with text_io;
use text_io;
with Ada.Integer_Text_IO; 
use Ada.Integer_Text_IO;
package body Sorting is
  
 function Split(low, high: integer) return array_index is
  M: integer := A(high);
  I: Integer := low - 1;
  begin
    M := A(high);
    I := (low-1);
    for J in low..high-1 loop
      if(A(j) < M) then
        I := I + 1;
        swap(I,J);
      end if;
    end loop;
    swap(I+1, high);
    return (I+1);
  end;

  procedure sortTask(low: Integer; pivot: Integer; high: Integer) is
        task sortLeft;
        task sortRight;

        task body sortLeft is
        begin
            qsort (low, pivot-1);
        end sortLeft;

        task body sortRight is
        begin
            qsort (pivot+1, high);
        end sortRight;
    begin
        null;
    end sortTask;

  procedure qsort(low: Integer; high: Integer) is
    pivot: array_index;
    begin
        if low >= high then 
            return;
        else
            pivot := split(low, high);
            sortTask (low, pivot, high);
        end if;
    end qsort;

  procedure swap(i,j: in array_index) is
        temp: array_range;
    begin
        temp := A(i);
        A(i) := A(j);
        A(j) := temp;
    end swap;
end Sorting;
