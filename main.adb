with Ada.Text_IO; use Ada.Text_IO;
with AdaOC;

procedure Main is
	Solution : Integer;
begin
	Solution := AdaOC.Solve(File => "",
	                        Day  => 1);
	Put_Line (Solution'Image);
end Main;

