PROGRAM ex8;
CONST
	TAILLE_TABLEAU = 10;
	VALEUR_MAX = 10;
VAR
	nombres: ARRAY[0..TAILLE_TABLEAU] OF INTEGER;
	i: INTEGER;
	nombre: INTEGER;
BEGIN
	Randomize;
	for i := 0 to TAILLE_TABLEAU do
		nombres[i] := Random(VALEUR_MAX + 1);
	Write('Nombre à rechercher: ');
	ReadLn(nombre);
	for i := 0 to TAILLE_TABLEAU do
	BEGIN
		WriteLn('Nombre n°', i, ': ', nombres[i]);
		if (nombres[i] = nombre) then
			halt(0);
	END;
	WriteLn('Aucun nombre trouvé');
END.
