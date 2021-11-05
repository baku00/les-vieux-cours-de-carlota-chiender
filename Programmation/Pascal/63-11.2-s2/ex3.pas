program ex3;
var
	n: integer;
	nbr: integer;
	i: integer;
begin
	nbr := 1;
	repeat
		write('(', n , ')Saisissez un nombre supérieur à 0: ');
		readln(n);
	until n > 0;
	for i:=1 to n do
		nbr *= i;
	writeln('Factoriel: ', nbr);
end.
