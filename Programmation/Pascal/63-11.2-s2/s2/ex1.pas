PROGRAM ex1;
VAR
	total_nombres: INTEGER;
	nombre: INTEGER;
	nombres: ARRAY[0..100] OF INTEGER;
	i: INTEGER;
BEGIN
	REPEAT
		Write('Nombre de nombres souhaité: ');
		ReadLn(total_nombres);
	UNTIL (total_nombres > 0);
	FOR i := 0 TO total_nombres - 1 DO BEGIN
		Write('Saisie du nombre n°', i, ': ');
		ReadLn(nombre);
		nombres[i] := nombre;
	END;

	WriteLn('==================');
	WriteLn('Liste des nombres:');
	FOR i := 0 TO total_nombres - 1 DO BEGIN
		WriteLn('nombres[', i, ']: ', nombres[i]);
	END;
END.
