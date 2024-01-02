with Ada.text_io;       use Ada.text_io;
with Ada.strings;       use Ada.strings;
with Ada.strings.fixed; use Ada.strings.fixed;
with Ada.strings.maps;  use Ada.strings.maps;

package body Trebuchet is

	function part_1 (f : File_Type) return Integer is
		total : Integer := 0;
	begin

		while not end_of_file (f) loop
			declare

				line    : String        := get_line (f);
				chars   : Character_Set := to_set (span => ('0', '9'));
				first_i : Natural;
				last_i  : Natural;
				first   : Integer;
				last    : Integer;

			begin

				first_i :=
					index
						(source => line,
						 set    => chars);
				last_i :=
					index
						(source => line,
						 set    => chars,
						 going  => Backward);
					
				first := integer'value ((1 => line(first_i)));
				last := integer'value ((1 => line(last_i)));

				total := total + 10 * first + last;

			end;
		end loop;

		return total;

	end part_1;

	function part_2 (f : File_Type) return Integer is
	begin
		return 0;
	end part_2;

end Trebuchet;

