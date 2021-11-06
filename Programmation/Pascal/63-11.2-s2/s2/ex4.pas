PROGRAM ex4;
CONST
	TAILLE_TABLEAU = 10;
	VALEUR_MAX = 100;
VAR
	nombres: ARRAY[0..TAILLE_TABLEAU] OF INTEGER;
	i: INTEGER;
BEGIN
	Randomize;
	for i := 0 to TAILLE_TABLEAU do
		nombres[i] := Random(VALEUR_MAX + 1);
	for i := 0 to TAILLE_TABLEAU do
		WriteLn('Nombre n°', i, ': ', nombres[i]);
END.
