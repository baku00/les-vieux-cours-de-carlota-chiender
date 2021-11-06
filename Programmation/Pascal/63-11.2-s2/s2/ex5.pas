PROGRAM ex5;
CONST
	TAILLE_TABLEAU = 10;
	VALEUR_MAX = 100;
VAR
	tailleTableau: INTEGER;
	nombres: ARRAY[0..TAILLE_TABLEAU] OF INTEGER;
	i: INTEGER;
BEGIN
	tailleTableau := TAILLE_TABLEAU + 1;
	WHILE tailleTableau >= TAILLE_TABLEAU DO BEGIN
		Write('Nombre de nombres à générer aléatoirement: ');
		ReadLn(tailleTableau);
	END;
	Randomize;
	for i := 0 to tailleTableau do
		nombres[i] := Random(VALEUR_MAX + 1);
	for i := 0 to tailleTableau do
		WriteLn('Nombre n°', i, ': ', nombres[i]);
END.
