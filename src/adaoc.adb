with Ada.text_io;           use Ada.text_io;
with Ada.command_line;      use Ada.command_line;
with Ada.strings.unbounded; use Ada.strings.unbounded;

procedure adaoc is

	type Day is new Integer range 1..25;

	d    : Day;
	file : Unbounded_String;
	sol  : Integer;

begin

	if argument_count < 2 then
		put_line ("Usage:");
		put_line ("  " & command_name & " <day> <input_file>");
		set_exit_status (Failure);
		return;
	end if;

	declare
		input : Integer := Integer'value (argument (1));
	begin

		if input not in 1..25 then
			put_line
				("Day" & input'image & " is out of Advent Canendar range");
			put_line
				("Enter day number between" & Day'first'image
				 & " and" & Day'last'image);
			set_exit_status (Failure);
			return;
		end if;

		d := Day (input);

	end;

	file := to_unbounded_string (argument (2));

	put_line
		("Solving day" & d'image
		 & " with file '" & to_string (file) & "'");
	sol := 0;

	put_line (sol'image);

end adaoc;

