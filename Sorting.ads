package Sorting is
  size : constant integer := 40;
  subtype array_index is integer range 1..size;
  subtype array_range is integer range 0..500;
  A: array (array_index) of array_range;
  procedure QSort(low, high: Integer);
  procedure swap (i,j: in array_index);
end Sorting;
