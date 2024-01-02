with Ada.text_io;      use Ada.text_io;
with Ada.command_line; use Ada.command_line;
with Trebuchet;

procedure adaoc is

	type Day is new Integer range 1..25;

	d      : Day;
	part_1 : Integer;
	part_2 : Integer;

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

	declare

		file      : File_Type;
		file_name : String := argument (2);

	begin

		put_line
			("Solving day" & d'image
			& " with file '" & file_name & "'");
		open
			(file => file,
			 mode => In_File,
			 name => file_name);

		case d is
			when 1 =>
				part_1 := Trebuchet.part_1 (file);
				part_2 := Trebuchet.part_2 (file);
			when others =>
				put_line ("Not yet implemented");
				set_exit_status (Failure);
				return;
		end case;

	end;

	put_line ("Part 1:" & part_1'image);
	put_line ("Part 2:" & part_2'image);

end adaoc;

