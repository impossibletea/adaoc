with Ada.text_io;           use Ada.text_io;
with Ada.strings;           use Ada.strings;
with Ada.strings.fixed;     use Ada.strings.fixed;
with Ada.strings.maps;      use Ada.strings.maps;
with Ada.strings.unbounded; use Ada.strings.unbounded;

package body Trebuchet is

	subtype UString is Unbounded_String;
	-- Natural range allows for direct correlation between value of digit and
	-- its index in the array
	type String_Set is Array (Natural range <>) of Ustring;

	function "+"(s : String) return Unbounded_String
		renames to_unbounded_string;

	part_1_set : constant String_Set :=
		(+"0", +"1", +"2", +"3", +"4",
		 +"5", +"6", +"7", +"8", +"9");
	part_2_set : constant String_Set :=
		(+"0", +"zero",
		 +"1", +"one",
		 +"2", +"two",
		 +"3", +"three",
		 +"4", +"four",
		 +"5", +"five",
		 +"6", +"six",
		 +"7", +"seven",
		 +"8", +"eight",
		 +"9", +"nine");

	function solve
		(f : File_Type;
		 s : String_Set) return Integer is
		total : Integer := 0;
	begin
		while not end_of_file (f) loop
			declare
				line    : String  := get_line (f);
				temp    : Natural;
				first_i : Natural := 99;
				last_i  : Natural := 0;
				first   : Integer;
				last    : Integer;
				scale   : constant Integer := s'length/10;
			begin
				for i in s'range loop
					temp := index
						(source  => line,
						 pattern => to_string (s(i)));
					if temp /= 0 and temp <= first_i then
						first_i := temp;
						first := i/scale;
					end if;
					temp := index
						(source  => line,
						 pattern => to_string (s(i)),
						 going   => Backward);
					if temp /= 0 and temp >= last_i then
						last_i := temp;
						last := i/scale;
					end if;
				end loop;

				total := total + 10 * first + last;
			end;
		end loop;
		return total;
	end solve;

	function part_1 (f : File_Type) return Integer is
	begin
		return solve (f, part_1_set);
	end part_1;

	function part_2 (f : File_Type) return Integer is
	begin
		return solve (f, part_2_set);
	end part_2;

end Trebuchet;

