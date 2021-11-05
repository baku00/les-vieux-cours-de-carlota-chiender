program ex7;
var
	n: integer;
	i: integer;
	result: integer;
begin
	repeat
		write('Multiple entre 0 et 50: ');
		readln(n);
	until (n >= 0) and (n <= 50);
	result := -1;
	while i <= n do
	begin
		while (result <> i * n) do
		begin
			write(i, ' * ', n, ' = ');
			readln(result);
			if (result <> i * n) then
				writeln('Erreur');
		end;
		writeln('Wesh, bien jouer ma poule !');
		i+=1;
	end;
end.
