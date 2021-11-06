program ex8;
var
	naissance: integer;
begin
	write('Année de naissance: ');
	readln(naissance);
	if (naissance <= 1582) then
	begin
		if (naissance mod 4 = 0) then
			writeln('Bissextille')
		else
			writeln('Non bissextille');
		halt(0);
	end;
	if ((naissance mod 4 = 0) and (naissance mod 100 <> 0)) or (naissance mod 400 = 0) then
		writeln('Bissextille')
	else
		writeln('Non bissextille');
end.
