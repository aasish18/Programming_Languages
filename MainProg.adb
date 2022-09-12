with text_io;
with Sorting;
use text_io;
with Ada.Text_IO; 
use Ada.Text_IO;

procedure MainProg is
	use text_io;
	package int_io is new integer_io(integer);
	use int_io;
	use Sorting;
	input:Integer;
	Sum : Integer := 0;
	index : Integer := 1;
   
   procedure performTasks is
		task PrintTask is
      		entry printArray;
	  		entry printSum;
   		end PrintTask;
   
   		Task AddingTask is
    		entry performSum;
   		end AddingTask;

   		Task SortingTask is
    		entry performSort;
   		end SortingTask;

    	task body AddingTask is
        begin
           	accept performSum do
            	for I in 1..size loop
                	Sum := Sum + A(I);
            	end loop;
	    	end performSum;
			PrintTask.printSum;
        end AddingTask;

		task body SortingTask is
        begin
            accept performSort do
				QSort(1,size);
            end performSort;
			PrintTask.PrintArray;
        end SortingTask;

   		task body PrintTask is
   		begin
			New_Line;
			put("Given input : ");
			New_Line;
        	for I in 1..size loop
            	Put(A(I));
				New_Line;
        	end loop;
			New_Line;
			put("Sorted version of input : ");
			New_Line;
			SortingTask.performSort;
			accept PrintArray do
				for I in 1..size loop
           			Put(A(I));
					new_Line;
				end loop;
			end PrintArray;
			New_Line;
			AddingTask.performSum;
			accept printSum do
				put_line("Sum of the given input : " & Integer'Image(Sum));
			end printSum;
   		end PrintTask;

   	begin
		null;
   end performTasks;

begin
	put_line("Read in" & Integer'Image(size) & " numbers between 0 to 500 > ");
	for i in 1 .. size loop
		get(input);
		A(index) := input;
    	index := index + 1;
	end loop;
	performTasks;
end MainProg;