PROGRAM ex2;
VAR
	total_nombres: INTEGER;
	nombre: INTEGER;
	nombres: ARRAY[0..100] OF INTEGER;
	i: INTEGER;
	somme: INTEGER;
BEGIN
	somme := 0;
	total_nombres := 100;
	FOR i := 0 TO total_nombres - 1 DO BEGIN
		Write('Saisie du nombre n°', i, ': ');
		ReadLn(nombre);
		if (nombre = 0) THEN
		BEGIN
			total_nombres := i;
			Break;
		END;
		somme += nombre;
		nombres[i] := nombre;
	END;

	WriteLn('==================');
	WriteLn('Liste des nombres:');
	FOR i := total_nombres - 1 DOWNTO 0 DO BEGIN
		WriteLn('---------------');
		WriteLn('Nombre n°: ', i);
		WriteLn('-     ', nombres[i]);
		Write('Pair: ');
		if (nombres[i] mod 2 = 0) THEN
			WriteLn('Oui')
		ELSE
			WriteLn('Non');
		WriteLn('---------------');
	END;
	WriteLn('');
	WriteLn('Somme: ' , somme);
END.
