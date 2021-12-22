program test;
var
	tabEntier: ARRAY[0..4] OF INTEGER;
	i: INTEGER;
begin
	FOR i := 0 TO 4 DO BEGIN
		WriteLn('tabEntier[', i, ']: ', tabEntier[i]);
		Write('Veuillez saisir la valeur de tabEntier[', i, ']: ');
		ReadLn(tabEntier[i]);
		WriteLn('La nouvelle valeur de tabEntier[', i, '] est ', tabEntier[i]);
		WriteLn('');
	END;
end.
