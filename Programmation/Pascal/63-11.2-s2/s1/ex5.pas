program ex5;
var
	n: integer;
	i: integer;
begin
	repeat
		write('Nombre entre 1 et 100 (compris): ');
		readln(n)
	until (n >= 1) and (n <= 100);
	if (n mod 2 = 0) and (n > 2) then
	begin
		writeln('Non premier');
		halt(0);
	end;
	i := 2;
	while i < n do
	begin
		if ((n mod i) = 0) then
		begin
			writeln('Non premier');
			halt(0);
		end;
		i += 1;
	end;
	writeln('Premier');
end.
