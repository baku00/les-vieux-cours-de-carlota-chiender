PROGRAM ex8;
CONST
	TAILLE_TABLEAU = 10;
	VALEUR_MAX = 100;
VAR
	nombres: ARRAY[0..TAILLE_TABLEAU] OF INTEGER;
	i: INTEGER;
	position: INTEGER;
	minimal: INTEGER;
BEGIN
	minimal := VALEUR_MAX + 1;
	Randomize;
	for i := 0 to TAILLE_TABLEAU do
		nombres[i] := Random(VALEUR_MAX + 1);
	for i := 0 to TAILLE_TABLEAU do
	BEGIN
		WriteLn('Nombre n°', i, ': ', nombres[i]);
		if (nombres[i] < minimal) then
		BEGIN
			position := i;
			minimal := nombres[i];
		END;
	END;
	WriteLn('================');
	WriteLn('Position: ', position);
	WriteLn('Nombre: ', nombres[position]);
END.
