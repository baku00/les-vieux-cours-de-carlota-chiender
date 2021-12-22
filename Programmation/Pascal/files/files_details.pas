PROGRAM litfichier;
VAR
	fLec		: Text;
	LigneLue	: String;
	PosAvant	: Integer;
	PosApres	: Integer;
	Position	: Integer;
BEGIN
	Assign(fLec, 'test.txt');
	{--
		Contenu de test.txt
		17,21
		17,32
		18,43
		19,34
	--}
	Reset(fLec);
	WHILE NOT Eof(fLec) DO
	BEGIN
		ReadLn(fLec, LigneLue);
		WriteLn(LigneLue);
		PosAvant := Pos(',', LigneLue) - 1;
		PosApres := PosAvant + 2;
		WriteLn('Avant: Position = ', PosAvant, '; Valeur = ', Copy(LigneLue, 1, PosAvant));
		WriteLn('Apres: Position = ', PosApres, '; Valeur = ', Copy(LigneLue, PosApres, Length(LigneLue)));
		WriteLn('');
	END;
	{--
		Premier tour:
		LigneLue = 17,21
		PosAvant := Pos(',', LigneLue) - 1;
		Permet de récupérer la position de la ',' dans la chaîne LigneLue
		Et soustraction de 1 pour obtenir la position du dernier chiffre

		Exemple:
		Position: 1 2 3 4 5
		LigneLue: 1 7 , 2 1
		Valeur tirer avec Pos(',', LigneLue): 3
		3 - 1 = 2
		2 correspond à la position du dernier chiffre avant la virgule (7)

		Reprise des explications:
		PosApres := PosAvant + 2
		On connaît la position du dernier chiffre grâce à PosAvant
		Addition de 1 pour arriver sur la virgule
		Encore une addition de 1 (Donc addition de 2 au total) pour arriver sur le chiffre juste après la virgule

		WriteLn('Avant: Position = ', PosAvant, '; Valeur = ', Copy(LigneLue, 1, PosAvant));
		Afficher la position du premier numéro et sa valeur
		Copy(LigneLue, 1, PosAvant)
		On copie les caractères de la première position jusqu'à PosAvant afin de récupérer la première valeur de la ligne (17)

		WriteLn('Apres: Position = ', PosApres, '; Valeur = ', Copy(LigneLue, PosApres, Length(LigneLue)));
		Afficher la position du deuxième numéro et sa valeur
		Copy(LigneLue, PosApres, Length(LigneLue))
		On copie les caractères de la position de PosApres jusqu'à la taille de LigneLue (21)
	--}
	Close(fLec);
END.
