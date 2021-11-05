program ex4;
var
	col1: integer;
	col2: integer;
	col3: integer;
	col: integer;
begin
	randomize;
	col1 := random(5) + 1;
	col2 := random(5) + 1;
	col3 := random(5) + 1;
	writeln(col1, ' ', col2, ' ', col3);
	while (col1 <> col2) or (col2 <> col3) or (col1 <> col3) do
	begin
		write('Numéro de la colonne: ');
		readln(col);
		if (col = 1) or (col < 1) or (col > 3) then
			col1 := random(5) + 1;
		if (col = 2) or (col < 1) or (col > 3) then
			col2 := random(5) + 1;
		if (col = 3) or (col < 1) or (col > 3) then
			col3 := random(5) + 1;
		writeln(col1, ' ', col2, ' ', col3);
	end;
end.
